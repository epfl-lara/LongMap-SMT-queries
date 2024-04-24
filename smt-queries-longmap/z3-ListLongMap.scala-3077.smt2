; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43340 () Bool)

(assert start!43340)

(declare-fun b_free!12181 () Bool)

(declare-fun b_next!12181 () Bool)

(assert (=> start!43340 (= b_free!12181 (not b_next!12181))))

(declare-fun tp!42819 () Bool)

(declare-fun b_and!20947 () Bool)

(assert (=> start!43340 (= tp!42819 b_and!20947)))

(declare-fun b!480137 () Bool)

(declare-fun e!282528 () Bool)

(declare-fun tp_is_empty!13693 () Bool)

(assert (=> b!480137 (= e!282528 tp_is_empty!13693)))

(declare-fun b!480138 () Bool)

(declare-fun res!286381 () Bool)

(declare-fun e!282526 () Bool)

(assert (=> b!480138 (=> (not res!286381) (not e!282526))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480138 (= res!286381 (validKeyInArray!0 k0!1332))))

(declare-fun b!480139 () Bool)

(declare-fun e!282527 () Bool)

(declare-fun mapRes!22243 () Bool)

(assert (=> b!480139 (= e!282527 (and e!282528 mapRes!22243))))

(declare-fun condMapEmpty!22243 () Bool)

(declare-datatypes ((V!19329 0))(
  ( (V!19330 (val!6894 Int)) )
))
(declare-datatypes ((ValueCell!6485 0))(
  ( (ValueCellFull!6485 (v!9186 V!19329)) (EmptyCell!6485) )
))
(declare-datatypes ((array!31042 0))(
  ( (array!31043 (arr!14925 (Array (_ BitVec 32) ValueCell!6485)) (size!15283 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31042)

(declare-fun mapDefault!22243 () ValueCell!6485)

(assert (=> b!480139 (= condMapEmpty!22243 (= (arr!14925 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6485)) mapDefault!22243)))))

(declare-fun res!286378 () Bool)

(assert (=> start!43340 (=> (not res!286378) (not e!282526))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43340 (= res!286378 (validMask!0 mask!2352))))

(assert (=> start!43340 e!282526))

(assert (=> start!43340 true))

(assert (=> start!43340 tp_is_empty!13693))

(declare-fun array_inv!10840 (array!31042) Bool)

(assert (=> start!43340 (and (array_inv!10840 _values!1516) e!282527)))

(assert (=> start!43340 tp!42819))

(declare-datatypes ((array!31044 0))(
  ( (array!31045 (arr!14926 (Array (_ BitVec 32) (_ BitVec 64))) (size!15284 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31044)

(declare-fun array_inv!10841 (array!31044) Bool)

(assert (=> start!43340 (array_inv!10841 _keys!1874)))

(declare-fun b!480140 () Bool)

(declare-fun e!282525 () Bool)

(declare-fun arrayContainsKey!0 (array!31044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480140 (= e!282525 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480141 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480141 (= e!282525 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480142 () Bool)

(declare-fun res!286377 () Bool)

(assert (=> b!480142 (=> (not res!286377) (not e!282526))))

(declare-fun minValue!1458 () V!19329)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19329)

(declare-datatypes ((tuple2!8966 0))(
  ( (tuple2!8967 (_1!4494 (_ BitVec 64)) (_2!4494 V!19329)) )
))
(declare-datatypes ((List!9036 0))(
  ( (Nil!9033) (Cons!9032 (h!9888 tuple2!8966) (t!15238 List!9036)) )
))
(declare-datatypes ((ListLongMap!7881 0))(
  ( (ListLongMap!7882 (toList!3956 List!9036)) )
))
(declare-fun contains!2586 (ListLongMap!7881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2270 (array!31044 array!31042 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 32) Int) ListLongMap!7881)

(assert (=> b!480142 (= res!286377 (contains!2586 (getCurrentListMap!2270 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480143 () Bool)

(declare-fun res!286380 () Bool)

(assert (=> b!480143 (=> (not res!286380) (not e!282526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31044 (_ BitVec 32)) Bool)

(assert (=> b!480143 (= res!286380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480144 () Bool)

(declare-fun res!286382 () Bool)

(assert (=> b!480144 (=> (not res!286382) (not e!282526))))

(declare-datatypes ((List!9037 0))(
  ( (Nil!9034) (Cons!9033 (h!9889 (_ BitVec 64)) (t!15239 List!9037)) )
))
(declare-fun arrayNoDuplicates!0 (array!31044 (_ BitVec 32) List!9037) Bool)

(assert (=> b!480144 (= res!286382 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9034))))

(declare-fun b!480145 () Bool)

(declare-fun res!286379 () Bool)

(assert (=> b!480145 (=> (not res!286379) (not e!282526))))

(assert (=> b!480145 (= res!286379 (and (= (size!15283 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15284 _keys!1874) (size!15283 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480146 () Bool)

(assert (=> b!480146 (= e!282526 (not true))))

(declare-fun lt!218119 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31044 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480146 (= lt!218119 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480146 e!282525))

(declare-fun c!57730 () Bool)

(assert (=> b!480146 (= c!57730 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14049 0))(
  ( (Unit!14050) )
))
(declare-fun lt!218118 () Unit!14049)

(declare-fun lemmaKeyInListMapIsInArray!118 (array!31044 array!31042 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 64) Int) Unit!14049)

(assert (=> b!480146 (= lt!218118 (lemmaKeyInListMapIsInArray!118 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22243 () Bool)

(declare-fun tp!42820 () Bool)

(declare-fun e!282523 () Bool)

(assert (=> mapNonEmpty!22243 (= mapRes!22243 (and tp!42820 e!282523))))

(declare-fun mapKey!22243 () (_ BitVec 32))

(declare-fun mapValue!22243 () ValueCell!6485)

(declare-fun mapRest!22243 () (Array (_ BitVec 32) ValueCell!6485))

(assert (=> mapNonEmpty!22243 (= (arr!14925 _values!1516) (store mapRest!22243 mapKey!22243 mapValue!22243))))

(declare-fun b!480147 () Bool)

(assert (=> b!480147 (= e!282523 tp_is_empty!13693)))

(declare-fun mapIsEmpty!22243 () Bool)

(assert (=> mapIsEmpty!22243 mapRes!22243))

(assert (= (and start!43340 res!286378) b!480145))

(assert (= (and b!480145 res!286379) b!480143))

(assert (= (and b!480143 res!286380) b!480144))

(assert (= (and b!480144 res!286382) b!480142))

(assert (= (and b!480142 res!286377) b!480138))

(assert (= (and b!480138 res!286381) b!480146))

(assert (= (and b!480146 c!57730) b!480140))

(assert (= (and b!480146 (not c!57730)) b!480141))

(assert (= (and b!480139 condMapEmpty!22243) mapIsEmpty!22243))

(assert (= (and b!480139 (not condMapEmpty!22243)) mapNonEmpty!22243))

(get-info :version)

(assert (= (and mapNonEmpty!22243 ((_ is ValueCellFull!6485) mapValue!22243)) b!480147))

(assert (= (and b!480139 ((_ is ValueCellFull!6485) mapDefault!22243)) b!480137))

(assert (= start!43340 b!480139))

(declare-fun m!462097 () Bool)

(assert (=> b!480146 m!462097))

(declare-fun m!462099 () Bool)

(assert (=> b!480146 m!462099))

(declare-fun m!462101 () Bool)

(assert (=> b!480143 m!462101))

(declare-fun m!462103 () Bool)

(assert (=> b!480144 m!462103))

(declare-fun m!462105 () Bool)

(assert (=> b!480142 m!462105))

(assert (=> b!480142 m!462105))

(declare-fun m!462107 () Bool)

(assert (=> b!480142 m!462107))

(declare-fun m!462109 () Bool)

(assert (=> mapNonEmpty!22243 m!462109))

(declare-fun m!462111 () Bool)

(assert (=> b!480140 m!462111))

(declare-fun m!462113 () Bool)

(assert (=> start!43340 m!462113))

(declare-fun m!462115 () Bool)

(assert (=> start!43340 m!462115))

(declare-fun m!462117 () Bool)

(assert (=> start!43340 m!462117))

(declare-fun m!462119 () Bool)

(assert (=> b!480138 m!462119))

(check-sat (not b!480140) (not b!480138) tp_is_empty!13693 (not b_next!12181) (not b!480142) b_and!20947 (not b!480146) (not b!480143) (not mapNonEmpty!22243) (not b!480144) (not start!43340))
(check-sat b_and!20947 (not b_next!12181))
