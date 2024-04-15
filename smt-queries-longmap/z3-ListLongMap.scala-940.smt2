; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20740 () Bool)

(assert start!20740)

(declare-fun b_free!5395 () Bool)

(declare-fun b_next!5395 () Bool)

(assert (=> start!20740 (= b_free!5395 (not b_next!5395))))

(declare-fun tp!19217 () Bool)

(declare-fun b_and!12115 () Bool)

(assert (=> start!20740 (= tp!19217 b_and!12115)))

(declare-fun b!207389 () Bool)

(declare-fun e!135377 () Bool)

(assert (=> b!207389 (= e!135377 (not true))))

(declare-datatypes ((V!6649 0))(
  ( (V!6650 (val!2670 Int)) )
))
(declare-datatypes ((ValueCell!2282 0))(
  ( (ValueCellFull!2282 (v!4634 V!6649)) (EmptyCell!2282) )
))
(declare-datatypes ((array!9697 0))(
  ( (array!9698 (arr!4598 (Array (_ BitVec 32) ValueCell!2282)) (size!4924 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9697)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6649)

(declare-datatypes ((tuple2!4030 0))(
  ( (tuple2!4031 (_1!2026 (_ BitVec 64)) (_2!2026 V!6649)) )
))
(declare-datatypes ((List!2934 0))(
  ( (Nil!2931) (Cons!2930 (h!3572 tuple2!4030) (t!7856 List!2934)) )
))
(declare-datatypes ((ListLongMap!2933 0))(
  ( (ListLongMap!2934 (toList!1482 List!2934)) )
))
(declare-fun lt!106167 () ListLongMap!2933)

(declare-datatypes ((array!9699 0))(
  ( (array!9700 (arr!4599 (Array (_ BitVec 32) (_ BitVec 64))) (size!4925 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9699)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6649)

(declare-fun getCurrentListMap!1023 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2933)

(assert (=> b!207389 (= lt!106167 (getCurrentListMap!1023 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106171 () ListLongMap!2933)

(declare-fun lt!106172 () array!9697)

(assert (=> b!207389 (= lt!106171 (getCurrentListMap!1023 _keys!825 lt!106172 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106168 () ListLongMap!2933)

(declare-fun lt!106169 () ListLongMap!2933)

(assert (=> b!207389 (and (= lt!106168 lt!106169) (= lt!106169 lt!106168))))

(declare-fun lt!106170 () ListLongMap!2933)

(declare-fun v!520 () V!6649)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!531 (ListLongMap!2933 tuple2!4030) ListLongMap!2933)

(assert (=> b!207389 (= lt!106169 (+!531 lt!106170 (tuple2!4031 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6302 0))(
  ( (Unit!6303) )
))
(declare-fun lt!106166 () Unit!6302)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!182 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) (_ BitVec 64) V!6649 (_ BitVec 32) Int) Unit!6302)

(assert (=> b!207389 (= lt!106166 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!182 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!433 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2933)

(assert (=> b!207389 (= lt!106168 (getCurrentListMapNoExtraKeys!433 _keys!825 lt!106172 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207389 (= lt!106172 (array!9698 (store (arr!4598 _values!649) i!601 (ValueCellFull!2282 v!520)) (size!4924 _values!649)))))

(assert (=> b!207389 (= lt!106170 (getCurrentListMapNoExtraKeys!433 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207390 () Bool)

(declare-fun e!135375 () Bool)

(declare-fun tp_is_empty!5251 () Bool)

(assert (=> b!207390 (= e!135375 tp_is_empty!5251)))

(declare-fun b!207392 () Bool)

(declare-fun res!100683 () Bool)

(assert (=> b!207392 (=> (not res!100683) (not e!135377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9699 (_ BitVec 32)) Bool)

(assert (=> b!207392 (= res!100683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207393 () Bool)

(declare-fun res!100679 () Bool)

(assert (=> b!207393 (=> (not res!100679) (not e!135377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207393 (= res!100679 (validKeyInArray!0 k0!843))))

(declare-fun b!207394 () Bool)

(declare-fun res!100684 () Bool)

(assert (=> b!207394 (=> (not res!100684) (not e!135377))))

(assert (=> b!207394 (= res!100684 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4925 _keys!825))))))

(declare-fun b!207395 () Bool)

(declare-fun res!100680 () Bool)

(assert (=> b!207395 (=> (not res!100680) (not e!135377))))

(assert (=> b!207395 (= res!100680 (and (= (size!4924 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4925 _keys!825) (size!4924 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207396 () Bool)

(declare-fun res!100682 () Bool)

(assert (=> b!207396 (=> (not res!100682) (not e!135377))))

(assert (=> b!207396 (= res!100682 (= (select (arr!4599 _keys!825) i!601) k0!843))))

(declare-fun b!207397 () Bool)

(declare-fun e!135378 () Bool)

(declare-fun mapRes!8945 () Bool)

(assert (=> b!207397 (= e!135378 (and e!135375 mapRes!8945))))

(declare-fun condMapEmpty!8945 () Bool)

(declare-fun mapDefault!8945 () ValueCell!2282)

(assert (=> b!207397 (= condMapEmpty!8945 (= (arr!4598 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2282)) mapDefault!8945)))))

(declare-fun mapNonEmpty!8945 () Bool)

(declare-fun tp!19216 () Bool)

(declare-fun e!135376 () Bool)

(assert (=> mapNonEmpty!8945 (= mapRes!8945 (and tp!19216 e!135376))))

(declare-fun mapValue!8945 () ValueCell!2282)

(declare-fun mapKey!8945 () (_ BitVec 32))

(declare-fun mapRest!8945 () (Array (_ BitVec 32) ValueCell!2282))

(assert (=> mapNonEmpty!8945 (= (arr!4598 _values!649) (store mapRest!8945 mapKey!8945 mapValue!8945))))

(declare-fun b!207391 () Bool)

(assert (=> b!207391 (= e!135376 tp_is_empty!5251)))

(declare-fun res!100685 () Bool)

(assert (=> start!20740 (=> (not res!100685) (not e!135377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20740 (= res!100685 (validMask!0 mask!1149))))

(assert (=> start!20740 e!135377))

(declare-fun array_inv!3021 (array!9697) Bool)

(assert (=> start!20740 (and (array_inv!3021 _values!649) e!135378)))

(assert (=> start!20740 true))

(assert (=> start!20740 tp_is_empty!5251))

(declare-fun array_inv!3022 (array!9699) Bool)

(assert (=> start!20740 (array_inv!3022 _keys!825)))

(assert (=> start!20740 tp!19217))

(declare-fun mapIsEmpty!8945 () Bool)

(assert (=> mapIsEmpty!8945 mapRes!8945))

(declare-fun b!207398 () Bool)

(declare-fun res!100681 () Bool)

(assert (=> b!207398 (=> (not res!100681) (not e!135377))))

(declare-datatypes ((List!2935 0))(
  ( (Nil!2932) (Cons!2931 (h!3573 (_ BitVec 64)) (t!7857 List!2935)) )
))
(declare-fun arrayNoDuplicates!0 (array!9699 (_ BitVec 32) List!2935) Bool)

(assert (=> b!207398 (= res!100681 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2932))))

(assert (= (and start!20740 res!100685) b!207395))

(assert (= (and b!207395 res!100680) b!207392))

(assert (= (and b!207392 res!100683) b!207398))

(assert (= (and b!207398 res!100681) b!207394))

(assert (= (and b!207394 res!100684) b!207393))

(assert (= (and b!207393 res!100679) b!207396))

(assert (= (and b!207396 res!100682) b!207389))

(assert (= (and b!207397 condMapEmpty!8945) mapIsEmpty!8945))

(assert (= (and b!207397 (not condMapEmpty!8945)) mapNonEmpty!8945))

(get-info :version)

(assert (= (and mapNonEmpty!8945 ((_ is ValueCellFull!2282) mapValue!8945)) b!207391))

(assert (= (and b!207397 ((_ is ValueCellFull!2282) mapDefault!8945)) b!207390))

(assert (= start!20740 b!207397))

(declare-fun m!234663 () Bool)

(assert (=> b!207389 m!234663))

(declare-fun m!234665 () Bool)

(assert (=> b!207389 m!234665))

(declare-fun m!234667 () Bool)

(assert (=> b!207389 m!234667))

(declare-fun m!234669 () Bool)

(assert (=> b!207389 m!234669))

(declare-fun m!234671 () Bool)

(assert (=> b!207389 m!234671))

(declare-fun m!234673 () Bool)

(assert (=> b!207389 m!234673))

(declare-fun m!234675 () Bool)

(assert (=> b!207389 m!234675))

(declare-fun m!234677 () Bool)

(assert (=> b!207396 m!234677))

(declare-fun m!234679 () Bool)

(assert (=> mapNonEmpty!8945 m!234679))

(declare-fun m!234681 () Bool)

(assert (=> start!20740 m!234681))

(declare-fun m!234683 () Bool)

(assert (=> start!20740 m!234683))

(declare-fun m!234685 () Bool)

(assert (=> start!20740 m!234685))

(declare-fun m!234687 () Bool)

(assert (=> b!207398 m!234687))

(declare-fun m!234689 () Bool)

(assert (=> b!207393 m!234689))

(declare-fun m!234691 () Bool)

(assert (=> b!207392 m!234691))

(check-sat (not b!207392) b_and!12115 (not start!20740) tp_is_empty!5251 (not mapNonEmpty!8945) (not b!207393) (not b!207389) (not b!207398) (not b_next!5395))
(check-sat b_and!12115 (not b_next!5395))
