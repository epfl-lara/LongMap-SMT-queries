; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20500 () Bool)

(assert start!20500)

(declare-fun b_free!5155 () Bool)

(declare-fun b_next!5155 () Bool)

(assert (=> start!20500 (= b_free!5155 (not b_next!5155))))

(declare-fun tp!18496 () Bool)

(declare-fun b_and!11915 () Bool)

(assert (=> start!20500 (= tp!18496 b_and!11915)))

(declare-fun b!203474 () Bool)

(declare-fun res!97766 () Bool)

(declare-fun e!133204 () Bool)

(assert (=> b!203474 (=> (not res!97766) (not e!133204))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203474 (= res!97766 (validKeyInArray!0 k0!843))))

(declare-fun b!203475 () Bool)

(declare-fun e!133203 () Bool)

(assert (=> b!203475 (= e!133203 true)))

(declare-datatypes ((V!6329 0))(
  ( (V!6330 (val!2550 Int)) )
))
(declare-datatypes ((tuple2!3806 0))(
  ( (tuple2!3807 (_1!1914 (_ BitVec 64)) (_2!1914 V!6329)) )
))
(declare-datatypes ((List!2706 0))(
  ( (Nil!2703) (Cons!2702 (h!3344 tuple2!3806) (t!7629 List!2706)) )
))
(declare-datatypes ((ListLongMap!2721 0))(
  ( (ListLongMap!2722 (toList!1376 List!2706)) )
))
(declare-fun lt!102664 () ListLongMap!2721)

(declare-fun lt!102668 () ListLongMap!2721)

(declare-fun lt!102666 () tuple2!3806)

(declare-fun +!430 (ListLongMap!2721 tuple2!3806) ListLongMap!2721)

(assert (=> b!203475 (= lt!102664 (+!430 lt!102668 lt!102666))))

(declare-datatypes ((Unit!6142 0))(
  ( (Unit!6143) )
))
(declare-fun lt!102669 () Unit!6142)

(declare-fun v!520 () V!6329)

(declare-fun lt!102673 () ListLongMap!2721)

(declare-fun zeroValue!615 () V!6329)

(declare-fun addCommutativeForDiffKeys!146 (ListLongMap!2721 (_ BitVec 64) V!6329 (_ BitVec 64) V!6329) Unit!6142)

(assert (=> b!203475 (= lt!102669 (addCommutativeForDiffKeys!146 lt!102673 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203477 () Bool)

(declare-fun e!133202 () Bool)

(declare-fun tp_is_empty!5011 () Bool)

(assert (=> b!203477 (= e!133202 tp_is_empty!5011)))

(declare-fun mapIsEmpty!8585 () Bool)

(declare-fun mapRes!8585 () Bool)

(assert (=> mapIsEmpty!8585 mapRes!8585))

(declare-fun b!203478 () Bool)

(declare-fun res!97770 () Bool)

(assert (=> b!203478 (=> (not res!97770) (not e!133204))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9233 0))(
  ( (array!9234 (arr!4367 (Array (_ BitVec 32) (_ BitVec 64))) (size!4692 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9233)

(assert (=> b!203478 (= res!97770 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4692 _keys!825))))))

(declare-fun b!203479 () Bool)

(declare-fun e!133205 () Bool)

(assert (=> b!203479 (= e!133205 (and e!133202 mapRes!8585))))

(declare-fun condMapEmpty!8585 () Bool)

(declare-datatypes ((ValueCell!2162 0))(
  ( (ValueCellFull!2162 (v!4521 V!6329)) (EmptyCell!2162) )
))
(declare-datatypes ((array!9235 0))(
  ( (array!9236 (arr!4368 (Array (_ BitVec 32) ValueCell!2162)) (size!4693 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9235)

(declare-fun mapDefault!8585 () ValueCell!2162)

(assert (=> b!203479 (= condMapEmpty!8585 (= (arr!4368 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2162)) mapDefault!8585)))))

(declare-fun b!203480 () Bool)

(declare-fun res!97772 () Bool)

(assert (=> b!203480 (=> (not res!97772) (not e!133204))))

(declare-datatypes ((List!2707 0))(
  ( (Nil!2704) (Cons!2703 (h!3345 (_ BitVec 64)) (t!7630 List!2707)) )
))
(declare-fun arrayNoDuplicates!0 (array!9233 (_ BitVec 32) List!2707) Bool)

(assert (=> b!203480 (= res!97772 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2704))))

(declare-fun b!203481 () Bool)

(declare-fun res!97771 () Bool)

(assert (=> b!203481 (=> (not res!97771) (not e!133204))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9233 (_ BitVec 32)) Bool)

(assert (=> b!203481 (= res!97771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203482 () Bool)

(declare-fun e!133199 () Bool)

(assert (=> b!203482 (= e!133204 (not e!133199))))

(declare-fun res!97773 () Bool)

(assert (=> b!203482 (=> res!97773 e!133199)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203482 (= res!97773 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!102670 () ListLongMap!2721)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6329)

(declare-fun getCurrentListMap!956 (array!9233 array!9235 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2721)

(assert (=> b!203482 (= lt!102670 (getCurrentListMap!956 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102667 () ListLongMap!2721)

(declare-fun lt!102663 () array!9235)

(assert (=> b!203482 (= lt!102667 (getCurrentListMap!956 _keys!825 lt!102663 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102674 () ListLongMap!2721)

(declare-fun lt!102672 () ListLongMap!2721)

(assert (=> b!203482 (and (= lt!102674 lt!102672) (= lt!102672 lt!102674))))

(assert (=> b!203482 (= lt!102672 (+!430 lt!102673 lt!102666))))

(assert (=> b!203482 (= lt!102666 (tuple2!3807 k0!843 v!520))))

(declare-fun lt!102665 () Unit!6142)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!92 (array!9233 array!9235 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) (_ BitVec 64) V!6329 (_ BitVec 32) Int) Unit!6142)

(assert (=> b!203482 (= lt!102665 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!92 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!349 (array!9233 array!9235 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2721)

(assert (=> b!203482 (= lt!102674 (getCurrentListMapNoExtraKeys!349 _keys!825 lt!102663 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203482 (= lt!102663 (array!9236 (store (arr!4368 _values!649) i!601 (ValueCellFull!2162 v!520)) (size!4693 _values!649)))))

(assert (=> b!203482 (= lt!102673 (getCurrentListMapNoExtraKeys!349 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203483 () Bool)

(declare-fun res!97767 () Bool)

(assert (=> b!203483 (=> (not res!97767) (not e!133204))))

(assert (=> b!203483 (= res!97767 (= (select (arr!4367 _keys!825) i!601) k0!843))))

(declare-fun b!203484 () Bool)

(declare-fun res!97769 () Bool)

(assert (=> b!203484 (=> (not res!97769) (not e!133204))))

(assert (=> b!203484 (= res!97769 (and (= (size!4693 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4692 _keys!825) (size!4693 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203485 () Bool)

(declare-fun e!133200 () Bool)

(assert (=> b!203485 (= e!133200 tp_is_empty!5011)))

(declare-fun mapNonEmpty!8585 () Bool)

(declare-fun tp!18497 () Bool)

(assert (=> mapNonEmpty!8585 (= mapRes!8585 (and tp!18497 e!133200))))

(declare-fun mapKey!8585 () (_ BitVec 32))

(declare-fun mapRest!8585 () (Array (_ BitVec 32) ValueCell!2162))

(declare-fun mapValue!8585 () ValueCell!2162)

(assert (=> mapNonEmpty!8585 (= (arr!4368 _values!649) (store mapRest!8585 mapKey!8585 mapValue!8585))))

(declare-fun b!203476 () Bool)

(assert (=> b!203476 (= e!133199 e!133203)))

(declare-fun res!97768 () Bool)

(assert (=> b!203476 (=> res!97768 e!133203)))

(assert (=> b!203476 (= res!97768 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203476 (= lt!102667 lt!102664)))

(declare-fun lt!102671 () tuple2!3806)

(assert (=> b!203476 (= lt!102664 (+!430 lt!102672 lt!102671))))

(assert (=> b!203476 (= lt!102670 lt!102668)))

(assert (=> b!203476 (= lt!102668 (+!430 lt!102673 lt!102671))))

(assert (=> b!203476 (= lt!102667 (+!430 lt!102674 lt!102671))))

(assert (=> b!203476 (= lt!102671 (tuple2!3807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97774 () Bool)

(assert (=> start!20500 (=> (not res!97774) (not e!133204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20500 (= res!97774 (validMask!0 mask!1149))))

(assert (=> start!20500 e!133204))

(declare-fun array_inv!2851 (array!9235) Bool)

(assert (=> start!20500 (and (array_inv!2851 _values!649) e!133205)))

(assert (=> start!20500 true))

(assert (=> start!20500 tp_is_empty!5011))

(declare-fun array_inv!2852 (array!9233) Bool)

(assert (=> start!20500 (array_inv!2852 _keys!825)))

(assert (=> start!20500 tp!18496))

(assert (= (and start!20500 res!97774) b!203484))

(assert (= (and b!203484 res!97769) b!203481))

(assert (= (and b!203481 res!97771) b!203480))

(assert (= (and b!203480 res!97772) b!203478))

(assert (= (and b!203478 res!97770) b!203474))

(assert (= (and b!203474 res!97766) b!203483))

(assert (= (and b!203483 res!97767) b!203482))

(assert (= (and b!203482 (not res!97773)) b!203476))

(assert (= (and b!203476 (not res!97768)) b!203475))

(assert (= (and b!203479 condMapEmpty!8585) mapIsEmpty!8585))

(assert (= (and b!203479 (not condMapEmpty!8585)) mapNonEmpty!8585))

(get-info :version)

(assert (= (and mapNonEmpty!8585 ((_ is ValueCellFull!2162) mapValue!8585)) b!203485))

(assert (= (and b!203479 ((_ is ValueCellFull!2162) mapDefault!8585)) b!203477))

(assert (= start!20500 b!203479))

(declare-fun m!231033 () Bool)

(assert (=> start!20500 m!231033))

(declare-fun m!231035 () Bool)

(assert (=> start!20500 m!231035))

(declare-fun m!231037 () Bool)

(assert (=> start!20500 m!231037))

(declare-fun m!231039 () Bool)

(assert (=> mapNonEmpty!8585 m!231039))

(declare-fun m!231041 () Bool)

(assert (=> b!203476 m!231041))

(declare-fun m!231043 () Bool)

(assert (=> b!203476 m!231043))

(declare-fun m!231045 () Bool)

(assert (=> b!203476 m!231045))

(declare-fun m!231047 () Bool)

(assert (=> b!203474 m!231047))

(declare-fun m!231049 () Bool)

(assert (=> b!203482 m!231049))

(declare-fun m!231051 () Bool)

(assert (=> b!203482 m!231051))

(declare-fun m!231053 () Bool)

(assert (=> b!203482 m!231053))

(declare-fun m!231055 () Bool)

(assert (=> b!203482 m!231055))

(declare-fun m!231057 () Bool)

(assert (=> b!203482 m!231057))

(declare-fun m!231059 () Bool)

(assert (=> b!203482 m!231059))

(declare-fun m!231061 () Bool)

(assert (=> b!203482 m!231061))

(declare-fun m!231063 () Bool)

(assert (=> b!203475 m!231063))

(declare-fun m!231065 () Bool)

(assert (=> b!203475 m!231065))

(declare-fun m!231067 () Bool)

(assert (=> b!203483 m!231067))

(declare-fun m!231069 () Bool)

(assert (=> b!203481 m!231069))

(declare-fun m!231071 () Bool)

(assert (=> b!203480 m!231071))

(check-sat (not b!203475) (not mapNonEmpty!8585) (not start!20500) (not b!203481) (not b!203476) (not b_next!5155) (not b!203482) tp_is_empty!5011 (not b!203474) (not b!203480) b_and!11915)
(check-sat b_and!11915 (not b_next!5155))
