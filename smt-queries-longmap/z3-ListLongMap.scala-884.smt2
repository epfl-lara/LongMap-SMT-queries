; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20404 () Bool)

(assert start!20404)

(declare-fun b_free!5059 () Bool)

(declare-fun b_next!5059 () Bool)

(assert (=> start!20404 (= b_free!5059 (not b_next!5059))))

(declare-fun tp!18209 () Bool)

(declare-fun b_and!11779 () Bool)

(assert (=> start!20404 (= tp!18209 b_and!11779)))

(declare-fun b!201543 () Bool)

(declare-fun e!132072 () Bool)

(declare-fun e!132070 () Bool)

(assert (=> b!201543 (= e!132072 (not e!132070))))

(declare-fun res!96347 () Bool)

(assert (=> b!201543 (=> res!96347 e!132070)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201543 (= res!96347 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6201 0))(
  ( (V!6202 (val!2502 Int)) )
))
(declare-datatypes ((tuple2!3762 0))(
  ( (tuple2!3763 (_1!1892 (_ BitVec 64)) (_2!1892 V!6201)) )
))
(declare-datatypes ((List!2681 0))(
  ( (Nil!2678) (Cons!2677 (h!3319 tuple2!3762) (t!7603 List!2681)) )
))
(declare-datatypes ((ListLongMap!2665 0))(
  ( (ListLongMap!2666 (toList!1348 List!2681)) )
))
(declare-fun lt!100536 () ListLongMap!2665)

(declare-datatypes ((ValueCell!2114 0))(
  ( (ValueCellFull!2114 (v!4466 V!6201)) (EmptyCell!2114) )
))
(declare-datatypes ((array!9043 0))(
  ( (array!9044 (arr!4271 (Array (_ BitVec 32) ValueCell!2114)) (size!4597 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9043)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6201)

(declare-datatypes ((array!9045 0))(
  ( (array!9046 (arr!4272 (Array (_ BitVec 32) (_ BitVec 64))) (size!4598 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9045)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6201)

(declare-fun getCurrentListMap!909 (array!9045 array!9043 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!201543 (= lt!100536 (getCurrentListMap!909 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100526 () array!9043)

(declare-fun lt!100528 () ListLongMap!2665)

(assert (=> b!201543 (= lt!100528 (getCurrentListMap!909 _keys!825 lt!100526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100530 () ListLongMap!2665)

(declare-fun lt!100533 () ListLongMap!2665)

(assert (=> b!201543 (and (= lt!100530 lt!100533) (= lt!100533 lt!100530))))

(declare-fun lt!100523 () ListLongMap!2665)

(declare-fun lt!100525 () tuple2!3762)

(declare-fun +!397 (ListLongMap!2665 tuple2!3762) ListLongMap!2665)

(assert (=> b!201543 (= lt!100533 (+!397 lt!100523 lt!100525))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6201)

(assert (=> b!201543 (= lt!100525 (tuple2!3763 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6046 0))(
  ( (Unit!6047) )
))
(declare-fun lt!100532 () Unit!6046)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 (array!9045 array!9043 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) (_ BitVec 64) V!6201 (_ BitVec 32) Int) Unit!6046)

(assert (=> b!201543 (= lt!100532 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!319 (array!9045 array!9043 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2665)

(assert (=> b!201543 (= lt!100530 (getCurrentListMapNoExtraKeys!319 _keys!825 lt!100526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201543 (= lt!100526 (array!9044 (store (arr!4271 _values!649) i!601 (ValueCellFull!2114 v!520)) (size!4597 _values!649)))))

(assert (=> b!201543 (= lt!100523 (getCurrentListMapNoExtraKeys!319 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8441 () Bool)

(declare-fun mapRes!8441 () Bool)

(assert (=> mapIsEmpty!8441 mapRes!8441))

(declare-fun b!201544 () Bool)

(declare-fun e!132071 () Bool)

(assert (=> b!201544 (= e!132070 e!132071)))

(declare-fun res!96346 () Bool)

(assert (=> b!201544 (=> res!96346 e!132071)))

(assert (=> b!201544 (= res!96346 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100524 () ListLongMap!2665)

(declare-fun lt!100527 () ListLongMap!2665)

(assert (=> b!201544 (= lt!100524 lt!100527)))

(declare-fun lt!100538 () ListLongMap!2665)

(assert (=> b!201544 (= lt!100527 (+!397 lt!100538 lt!100525))))

(declare-fun lt!100529 () Unit!6046)

(declare-fun addCommutativeForDiffKeys!106 (ListLongMap!2665 (_ BitVec 64) V!6201 (_ BitVec 64) V!6201) Unit!6046)

(assert (=> b!201544 (= lt!100529 (addCommutativeForDiffKeys!106 lt!100523 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100537 () tuple2!3762)

(assert (=> b!201544 (= lt!100528 (+!397 lt!100524 lt!100537))))

(declare-fun lt!100531 () tuple2!3762)

(assert (=> b!201544 (= lt!100524 (+!397 lt!100533 lt!100531))))

(declare-fun lt!100534 () ListLongMap!2665)

(assert (=> b!201544 (= lt!100536 lt!100534)))

(assert (=> b!201544 (= lt!100534 (+!397 lt!100538 lt!100537))))

(assert (=> b!201544 (= lt!100538 (+!397 lt!100523 lt!100531))))

(assert (=> b!201544 (= lt!100528 (+!397 (+!397 lt!100530 lt!100531) lt!100537))))

(assert (=> b!201544 (= lt!100537 (tuple2!3763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201544 (= lt!100531 (tuple2!3763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201545 () Bool)

(assert (=> b!201545 (= e!132071 true)))

(assert (=> b!201545 (= (+!397 lt!100527 lt!100537) (+!397 lt!100534 lt!100525))))

(declare-fun lt!100535 () Unit!6046)

(assert (=> b!201545 (= lt!100535 (addCommutativeForDiffKeys!106 lt!100538 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201547 () Bool)

(declare-fun res!96350 () Bool)

(assert (=> b!201547 (=> (not res!96350) (not e!132072))))

(assert (=> b!201547 (= res!96350 (= (select (arr!4272 _keys!825) i!601) k0!843))))

(declare-fun b!201548 () Bool)

(declare-fun res!96352 () Bool)

(assert (=> b!201548 (=> (not res!96352) (not e!132072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201548 (= res!96352 (validKeyInArray!0 k0!843))))

(declare-fun b!201549 () Bool)

(declare-fun res!96351 () Bool)

(assert (=> b!201549 (=> (not res!96351) (not e!132072))))

(declare-datatypes ((List!2682 0))(
  ( (Nil!2679) (Cons!2678 (h!3320 (_ BitVec 64)) (t!7604 List!2682)) )
))
(declare-fun arrayNoDuplicates!0 (array!9045 (_ BitVec 32) List!2682) Bool)

(assert (=> b!201549 (= res!96351 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2679))))

(declare-fun b!201550 () Bool)

(declare-fun e!132069 () Bool)

(declare-fun e!132066 () Bool)

(assert (=> b!201550 (= e!132069 (and e!132066 mapRes!8441))))

(declare-fun condMapEmpty!8441 () Bool)

(declare-fun mapDefault!8441 () ValueCell!2114)

(assert (=> b!201550 (= condMapEmpty!8441 (= (arr!4271 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2114)) mapDefault!8441)))))

(declare-fun b!201551 () Bool)

(declare-fun res!96349 () Bool)

(assert (=> b!201551 (=> (not res!96349) (not e!132072))))

(assert (=> b!201551 (= res!96349 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4598 _keys!825))))))

(declare-fun b!201552 () Bool)

(declare-fun res!96345 () Bool)

(assert (=> b!201552 (=> (not res!96345) (not e!132072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9045 (_ BitVec 32)) Bool)

(assert (=> b!201552 (= res!96345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8441 () Bool)

(declare-fun tp!18208 () Bool)

(declare-fun e!132068 () Bool)

(assert (=> mapNonEmpty!8441 (= mapRes!8441 (and tp!18208 e!132068))))

(declare-fun mapRest!8441 () (Array (_ BitVec 32) ValueCell!2114))

(declare-fun mapKey!8441 () (_ BitVec 32))

(declare-fun mapValue!8441 () ValueCell!2114)

(assert (=> mapNonEmpty!8441 (= (arr!4271 _values!649) (store mapRest!8441 mapKey!8441 mapValue!8441))))

(declare-fun b!201546 () Bool)

(declare-fun tp_is_empty!4915 () Bool)

(assert (=> b!201546 (= e!132066 tp_is_empty!4915)))

(declare-fun res!96348 () Bool)

(assert (=> start!20404 (=> (not res!96348) (not e!132072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20404 (= res!96348 (validMask!0 mask!1149))))

(assert (=> start!20404 e!132072))

(declare-fun array_inv!2797 (array!9043) Bool)

(assert (=> start!20404 (and (array_inv!2797 _values!649) e!132069)))

(assert (=> start!20404 true))

(assert (=> start!20404 tp_is_empty!4915))

(declare-fun array_inv!2798 (array!9045) Bool)

(assert (=> start!20404 (array_inv!2798 _keys!825)))

(assert (=> start!20404 tp!18209))

(declare-fun b!201553 () Bool)

(assert (=> b!201553 (= e!132068 tp_is_empty!4915)))

(declare-fun b!201554 () Bool)

(declare-fun res!96353 () Bool)

(assert (=> b!201554 (=> (not res!96353) (not e!132072))))

(assert (=> b!201554 (= res!96353 (and (= (size!4597 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4598 _keys!825) (size!4597 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20404 res!96348) b!201554))

(assert (= (and b!201554 res!96353) b!201552))

(assert (= (and b!201552 res!96345) b!201549))

(assert (= (and b!201549 res!96351) b!201551))

(assert (= (and b!201551 res!96349) b!201548))

(assert (= (and b!201548 res!96352) b!201547))

(assert (= (and b!201547 res!96350) b!201543))

(assert (= (and b!201543 (not res!96347)) b!201544))

(assert (= (and b!201544 (not res!96346)) b!201545))

(assert (= (and b!201550 condMapEmpty!8441) mapIsEmpty!8441))

(assert (= (and b!201550 (not condMapEmpty!8441)) mapNonEmpty!8441))

(get-info :version)

(assert (= (and mapNonEmpty!8441 ((_ is ValueCellFull!2114) mapValue!8441)) b!201553))

(assert (= (and b!201550 ((_ is ValueCellFull!2114) mapDefault!8441)) b!201546))

(assert (= start!20404 b!201550))

(declare-fun m!228111 () Bool)

(assert (=> b!201547 m!228111))

(declare-fun m!228113 () Bool)

(assert (=> start!20404 m!228113))

(declare-fun m!228115 () Bool)

(assert (=> start!20404 m!228115))

(declare-fun m!228117 () Bool)

(assert (=> start!20404 m!228117))

(declare-fun m!228119 () Bool)

(assert (=> b!201552 m!228119))

(declare-fun m!228121 () Bool)

(assert (=> b!201548 m!228121))

(declare-fun m!228123 () Bool)

(assert (=> b!201549 m!228123))

(declare-fun m!228125 () Bool)

(assert (=> mapNonEmpty!8441 m!228125))

(declare-fun m!228127 () Bool)

(assert (=> b!201544 m!228127))

(declare-fun m!228129 () Bool)

(assert (=> b!201544 m!228129))

(declare-fun m!228131 () Bool)

(assert (=> b!201544 m!228131))

(declare-fun m!228133 () Bool)

(assert (=> b!201544 m!228133))

(declare-fun m!228135 () Bool)

(assert (=> b!201544 m!228135))

(declare-fun m!228137 () Bool)

(assert (=> b!201544 m!228137))

(assert (=> b!201544 m!228137))

(declare-fun m!228139 () Bool)

(assert (=> b!201544 m!228139))

(declare-fun m!228141 () Bool)

(assert (=> b!201544 m!228141))

(declare-fun m!228143 () Bool)

(assert (=> b!201543 m!228143))

(declare-fun m!228145 () Bool)

(assert (=> b!201543 m!228145))

(declare-fun m!228147 () Bool)

(assert (=> b!201543 m!228147))

(declare-fun m!228149 () Bool)

(assert (=> b!201543 m!228149))

(declare-fun m!228151 () Bool)

(assert (=> b!201543 m!228151))

(declare-fun m!228153 () Bool)

(assert (=> b!201543 m!228153))

(declare-fun m!228155 () Bool)

(assert (=> b!201543 m!228155))

(declare-fun m!228157 () Bool)

(assert (=> b!201545 m!228157))

(declare-fun m!228159 () Bool)

(assert (=> b!201545 m!228159))

(declare-fun m!228161 () Bool)

(assert (=> b!201545 m!228161))

(check-sat (not mapNonEmpty!8441) (not start!20404) (not b!201545) (not b!201543) (not b!201552) tp_is_empty!4915 (not b_next!5059) (not b!201544) (not b!201548) (not b!201549) b_and!11779)
(check-sat b_and!11779 (not b_next!5059))
