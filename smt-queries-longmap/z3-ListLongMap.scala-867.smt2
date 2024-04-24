; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20302 () Bool)

(assert start!20302)

(declare-fun b_free!4957 () Bool)

(declare-fun b_next!4957 () Bool)

(assert (=> start!20302 (= b_free!4957 (not b_next!4957))))

(declare-fun tp!17903 () Bool)

(declare-fun b_and!11717 () Bool)

(assert (=> start!20302 (= tp!17903 b_and!11717)))

(declare-fun res!95140 () Bool)

(declare-fun e!131183 () Bool)

(assert (=> start!20302 (=> (not res!95140) (not e!131183))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20302 (= res!95140 (validMask!0 mask!1149))))

(assert (=> start!20302 e!131183))

(declare-datatypes ((V!6065 0))(
  ( (V!6066 (val!2451 Int)) )
))
(declare-datatypes ((ValueCell!2063 0))(
  ( (ValueCellFull!2063 (v!4422 V!6065)) (EmptyCell!2063) )
))
(declare-datatypes ((array!8853 0))(
  ( (array!8854 (arr!4177 (Array (_ BitVec 32) ValueCell!2063)) (size!4502 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8853)

(declare-fun e!131179 () Bool)

(declare-fun array_inv!2725 (array!8853) Bool)

(assert (=> start!20302 (and (array_inv!2725 _values!649) e!131179)))

(assert (=> start!20302 true))

(declare-fun tp_is_empty!4813 () Bool)

(assert (=> start!20302 tp_is_empty!4813))

(declare-datatypes ((array!8855 0))(
  ( (array!8856 (arr!4178 (Array (_ BitVec 32) (_ BitVec 64))) (size!4503 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8855)

(declare-fun array_inv!2726 (array!8855) Bool)

(assert (=> start!20302 (array_inv!2726 _keys!825)))

(assert (=> start!20302 tp!17903))

(declare-fun b!199951 () Bool)

(assert (=> b!199951 (= e!131183 (not true))))

(declare-datatypes ((tuple2!3646 0))(
  ( (tuple2!3647 (_1!1834 (_ BitVec 64)) (_2!1834 V!6065)) )
))
(declare-datatypes ((List!2565 0))(
  ( (Nil!2562) (Cons!2561 (h!3203 tuple2!3646) (t!7488 List!2565)) )
))
(declare-datatypes ((ListLongMap!2561 0))(
  ( (ListLongMap!2562 (toList!1296 List!2565)) )
))
(declare-fun lt!98657 () ListLongMap!2561)

(declare-fun lt!98655 () array!8853)

(declare-fun zeroValue!615 () V!6065)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6065)

(declare-fun getCurrentListMap!893 (array!8855 array!8853 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) Int) ListLongMap!2561)

(assert (=> b!199951 (= lt!98657 (getCurrentListMap!893 _keys!825 lt!98655 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98656 () ListLongMap!2561)

(declare-fun lt!98658 () ListLongMap!2561)

(assert (=> b!199951 (and (= lt!98656 lt!98658) (= lt!98658 lt!98656))))

(declare-fun lt!98660 () ListLongMap!2561)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6065)

(declare-fun +!350 (ListLongMap!2561 tuple2!3646) ListLongMap!2561)

(assert (=> b!199951 (= lt!98658 (+!350 lt!98660 (tuple2!3647 k0!843 v!520)))))

(declare-datatypes ((Unit!5986 0))(
  ( (Unit!5987) )
))
(declare-fun lt!98659 () Unit!5986)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!29 (array!8855 array!8853 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) (_ BitVec 64) V!6065 (_ BitVec 32) Int) Unit!5986)

(assert (=> b!199951 (= lt!98659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!29 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!286 (array!8855 array!8853 (_ BitVec 32) (_ BitVec 32) V!6065 V!6065 (_ BitVec 32) Int) ListLongMap!2561)

(assert (=> b!199951 (= lt!98656 (getCurrentListMapNoExtraKeys!286 _keys!825 lt!98655 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199951 (= lt!98655 (array!8854 (store (arr!4177 _values!649) i!601 (ValueCellFull!2063 v!520)) (size!4502 _values!649)))))

(assert (=> b!199951 (= lt!98660 (getCurrentListMapNoExtraKeys!286 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8288 () Bool)

(declare-fun mapRes!8288 () Bool)

(declare-fun tp!17902 () Bool)

(declare-fun e!131181 () Bool)

(assert (=> mapNonEmpty!8288 (= mapRes!8288 (and tp!17902 e!131181))))

(declare-fun mapKey!8288 () (_ BitVec 32))

(declare-fun mapValue!8288 () ValueCell!2063)

(declare-fun mapRest!8288 () (Array (_ BitVec 32) ValueCell!2063))

(assert (=> mapNonEmpty!8288 (= (arr!4177 _values!649) (store mapRest!8288 mapKey!8288 mapValue!8288))))

(declare-fun b!199952 () Bool)

(declare-fun res!95139 () Bool)

(assert (=> b!199952 (=> (not res!95139) (not e!131183))))

(assert (=> b!199952 (= res!95139 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4503 _keys!825))))))

(declare-fun b!199953 () Bool)

(declare-fun res!95135 () Bool)

(assert (=> b!199953 (=> (not res!95135) (not e!131183))))

(assert (=> b!199953 (= res!95135 (and (= (size!4502 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4503 _keys!825) (size!4502 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199954 () Bool)

(declare-fun res!95137 () Bool)

(assert (=> b!199954 (=> (not res!95137) (not e!131183))))

(declare-datatypes ((List!2566 0))(
  ( (Nil!2563) (Cons!2562 (h!3204 (_ BitVec 64)) (t!7489 List!2566)) )
))
(declare-fun arrayNoDuplicates!0 (array!8855 (_ BitVec 32) List!2566) Bool)

(assert (=> b!199954 (= res!95137 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2563))))

(declare-fun b!199955 () Bool)

(declare-fun e!131180 () Bool)

(assert (=> b!199955 (= e!131180 tp_is_empty!4813)))

(declare-fun b!199956 () Bool)

(declare-fun res!95136 () Bool)

(assert (=> b!199956 (=> (not res!95136) (not e!131183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199956 (= res!95136 (validKeyInArray!0 k0!843))))

(declare-fun b!199957 () Bool)

(declare-fun res!95134 () Bool)

(assert (=> b!199957 (=> (not res!95134) (not e!131183))))

(assert (=> b!199957 (= res!95134 (= (select (arr!4178 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8288 () Bool)

(assert (=> mapIsEmpty!8288 mapRes!8288))

(declare-fun b!199958 () Bool)

(assert (=> b!199958 (= e!131181 tp_is_empty!4813)))

(declare-fun b!199959 () Bool)

(declare-fun res!95138 () Bool)

(assert (=> b!199959 (=> (not res!95138) (not e!131183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8855 (_ BitVec 32)) Bool)

(assert (=> b!199959 (= res!95138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199960 () Bool)

(assert (=> b!199960 (= e!131179 (and e!131180 mapRes!8288))))

(declare-fun condMapEmpty!8288 () Bool)

(declare-fun mapDefault!8288 () ValueCell!2063)

(assert (=> b!199960 (= condMapEmpty!8288 (= (arr!4177 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2063)) mapDefault!8288)))))

(assert (= (and start!20302 res!95140) b!199953))

(assert (= (and b!199953 res!95135) b!199959))

(assert (= (and b!199959 res!95138) b!199954))

(assert (= (and b!199954 res!95137) b!199952))

(assert (= (and b!199952 res!95139) b!199956))

(assert (= (and b!199956 res!95136) b!199957))

(assert (= (and b!199957 res!95134) b!199951))

(assert (= (and b!199960 condMapEmpty!8288) mapIsEmpty!8288))

(assert (= (and b!199960 (not condMapEmpty!8288)) mapNonEmpty!8288))

(get-info :version)

(assert (= (and mapNonEmpty!8288 ((_ is ValueCellFull!2063) mapValue!8288)) b!199958))

(assert (= (and b!199960 ((_ is ValueCellFull!2063) mapDefault!8288)) b!199955))

(assert (= start!20302 b!199960))

(declare-fun m!226521 () Bool)

(assert (=> start!20302 m!226521))

(declare-fun m!226523 () Bool)

(assert (=> start!20302 m!226523))

(declare-fun m!226525 () Bool)

(assert (=> start!20302 m!226525))

(declare-fun m!226527 () Bool)

(assert (=> mapNonEmpty!8288 m!226527))

(declare-fun m!226529 () Bool)

(assert (=> b!199954 m!226529))

(declare-fun m!226531 () Bool)

(assert (=> b!199959 m!226531))

(declare-fun m!226533 () Bool)

(assert (=> b!199957 m!226533))

(declare-fun m!226535 () Bool)

(assert (=> b!199956 m!226535))

(declare-fun m!226537 () Bool)

(assert (=> b!199951 m!226537))

(declare-fun m!226539 () Bool)

(assert (=> b!199951 m!226539))

(declare-fun m!226541 () Bool)

(assert (=> b!199951 m!226541))

(declare-fun m!226543 () Bool)

(assert (=> b!199951 m!226543))

(declare-fun m!226545 () Bool)

(assert (=> b!199951 m!226545))

(declare-fun m!226547 () Bool)

(assert (=> b!199951 m!226547))

(check-sat (not b_next!4957) (not start!20302) (not b!199959) tp_is_empty!4813 b_and!11717 (not mapNonEmpty!8288) (not b!199954) (not b!199951) (not b!199956))
(check-sat b_and!11717 (not b_next!4957))
