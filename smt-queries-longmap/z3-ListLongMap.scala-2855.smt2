; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41162 () Bool)

(assert start!41162)

(declare-fun b_free!11031 () Bool)

(declare-fun b_next!11031 () Bool)

(assert (=> start!41162 (= b_free!11031 (not b_next!11031))))

(declare-fun tp!38928 () Bool)

(declare-fun b_and!19301 () Bool)

(assert (=> start!41162 (= tp!38928 b_and!19301)))

(declare-fun b!459755 () Bool)

(declare-fun res!274795 () Bool)

(declare-fun e!268296 () Bool)

(assert (=> b!459755 (=> (not res!274795) (not e!268296))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459755 (= res!274795 (bvsle from!863 i!563))))

(declare-fun b!459756 () Bool)

(declare-fun res!274797 () Bool)

(declare-fun e!268302 () Bool)

(assert (=> b!459756 (=> (not res!274797) (not e!268302))))

(declare-datatypes ((array!28539 0))(
  ( (array!28540 (arr!13710 (Array (_ BitVec 32) (_ BitVec 64))) (size!14062 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28539)

(assert (=> b!459756 (= res!274797 (or (= (select (arr!13710 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13710 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459757 () Bool)

(declare-fun res!274804 () Bool)

(assert (=> b!459757 (=> (not res!274804) (not e!268302))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459757 (= res!274804 (validKeyInArray!0 k0!794))))

(declare-fun res!274793 () Bool)

(assert (=> start!41162 (=> (not res!274793) (not e!268302))))

(assert (=> start!41162 (= res!274793 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14062 _keys!709))))))

(assert (=> start!41162 e!268302))

(declare-fun tp_is_empty!12369 () Bool)

(assert (=> start!41162 tp_is_empty!12369))

(assert (=> start!41162 tp!38928))

(assert (=> start!41162 true))

(declare-datatypes ((V!17597 0))(
  ( (V!17598 (val!6229 Int)) )
))
(declare-datatypes ((ValueCell!5841 0))(
  ( (ValueCellFull!5841 (v!8507 V!17597)) (EmptyCell!5841) )
))
(declare-datatypes ((array!28541 0))(
  ( (array!28542 (arr!13711 (Array (_ BitVec 32) ValueCell!5841)) (size!14063 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28541)

(declare-fun e!268301 () Bool)

(declare-fun array_inv!9916 (array!28541) Bool)

(assert (=> start!41162 (and (array_inv!9916 _values!549) e!268301)))

(declare-fun array_inv!9917 (array!28539) Bool)

(assert (=> start!41162 (array_inv!9917 _keys!709)))

(declare-fun mapIsEmpty!20203 () Bool)

(declare-fun mapRes!20203 () Bool)

(assert (=> mapIsEmpty!20203 mapRes!20203))

(declare-fun b!459758 () Bool)

(declare-datatypes ((Unit!13365 0))(
  ( (Unit!13366) )
))
(declare-fun e!268300 () Unit!13365)

(declare-fun Unit!13367 () Unit!13365)

(assert (=> b!459758 (= e!268300 Unit!13367)))

(declare-fun lt!208022 () Unit!13365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13365)

(assert (=> b!459758 (= lt!208022 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459758 false))

(declare-fun b!459759 () Bool)

(declare-fun res!274791 () Bool)

(assert (=> b!459759 (=> (not res!274791) (not e!268302))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!459759 (= res!274791 (and (= (size!14063 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14062 _keys!709) (size!14063 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!20203 () Bool)

(declare-fun tp!38929 () Bool)

(declare-fun e!268299 () Bool)

(assert (=> mapNonEmpty!20203 (= mapRes!20203 (and tp!38929 e!268299))))

(declare-fun mapRest!20203 () (Array (_ BitVec 32) ValueCell!5841))

(declare-fun mapKey!20203 () (_ BitVec 32))

(declare-fun mapValue!20203 () ValueCell!5841)

(assert (=> mapNonEmpty!20203 (= (arr!13711 _values!549) (store mapRest!20203 mapKey!20203 mapValue!20203))))

(declare-fun b!459760 () Bool)

(declare-fun res!274802 () Bool)

(assert (=> b!459760 (=> (not res!274802) (not e!268296))))

(declare-fun lt!208023 () array!28539)

(declare-datatypes ((List!8285 0))(
  ( (Nil!8282) (Cons!8281 (h!9137 (_ BitVec 64)) (t!14195 List!8285)) )
))
(declare-fun arrayNoDuplicates!0 (array!28539 (_ BitVec 32) List!8285) Bool)

(assert (=> b!459760 (= res!274802 (arrayNoDuplicates!0 lt!208023 #b00000000000000000000000000000000 Nil!8282))))

(declare-fun b!459761 () Bool)

(declare-fun e!268297 () Bool)

(assert (=> b!459761 (= e!268296 e!268297)))

(declare-fun res!274798 () Bool)

(assert (=> b!459761 (=> (not res!274798) (not e!268297))))

(assert (=> b!459761 (= res!274798 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17597)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!208031 () array!28541)

(declare-fun zeroValue!515 () V!17597)

(declare-datatypes ((tuple2!8214 0))(
  ( (tuple2!8215 (_1!4118 (_ BitVec 64)) (_2!4118 V!17597)) )
))
(declare-datatypes ((List!8286 0))(
  ( (Nil!8283) (Cons!8282 (h!9138 tuple2!8214) (t!14196 List!8286)) )
))
(declare-datatypes ((ListLongMap!7127 0))(
  ( (ListLongMap!7128 (toList!3579 List!8286)) )
))
(declare-fun lt!208024 () ListLongMap!7127)

(declare-fun getCurrentListMapNoExtraKeys!1759 (array!28539 array!28541 (_ BitVec 32) (_ BitVec 32) V!17597 V!17597 (_ BitVec 32) Int) ListLongMap!7127)

(assert (=> b!459761 (= lt!208024 (getCurrentListMapNoExtraKeys!1759 lt!208023 lt!208031 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17597)

(assert (=> b!459761 (= lt!208031 (array!28542 (store (arr!13711 _values!549) i!563 (ValueCellFull!5841 v!412)) (size!14063 _values!549)))))

(declare-fun lt!208025 () ListLongMap!7127)

(assert (=> b!459761 (= lt!208025 (getCurrentListMapNoExtraKeys!1759 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459762 () Bool)

(declare-fun res!274800 () Bool)

(assert (=> b!459762 (=> (not res!274800) (not e!268302))))

(assert (=> b!459762 (= res!274800 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14062 _keys!709))))))

(declare-fun b!459763 () Bool)

(declare-fun res!274803 () Bool)

(assert (=> b!459763 (=> (not res!274803) (not e!268302))))

(declare-fun arrayContainsKey!0 (array!28539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459763 (= res!274803 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459764 () Bool)

(declare-fun e!268294 () Bool)

(assert (=> b!459764 (= e!268294 tp_is_empty!12369)))

(declare-fun b!459765 () Bool)

(declare-fun res!274796 () Bool)

(assert (=> b!459765 (=> (not res!274796) (not e!268302))))

(assert (=> b!459765 (= res!274796 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8282))))

(declare-fun b!459766 () Bool)

(assert (=> b!459766 (= e!268302 e!268296)))

(declare-fun res!274801 () Bool)

(assert (=> b!459766 (=> (not res!274801) (not e!268296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28539 (_ BitVec 32)) Bool)

(assert (=> b!459766 (= res!274801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208023 mask!1025))))

(assert (=> b!459766 (= lt!208023 (array!28540 (store (arr!13710 _keys!709) i!563 k0!794) (size!14062 _keys!709)))))

(declare-fun b!459767 () Bool)

(assert (=> b!459767 (= e!268299 tp_is_empty!12369)))

(declare-fun b!459768 () Bool)

(declare-fun Unit!13368 () Unit!13365)

(assert (=> b!459768 (= e!268300 Unit!13368)))

(declare-fun b!459769 () Bool)

(declare-fun res!274792 () Bool)

(assert (=> b!459769 (=> (not res!274792) (not e!268302))))

(assert (=> b!459769 (= res!274792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459770 () Bool)

(declare-fun e!268295 () Bool)

(assert (=> b!459770 (= e!268297 (not e!268295))))

(declare-fun res!274799 () Bool)

(assert (=> b!459770 (=> res!274799 e!268295)))

(assert (=> b!459770 (= res!274799 (not (validKeyInArray!0 (select (arr!13710 _keys!709) from!863))))))

(declare-fun lt!208028 () ListLongMap!7127)

(declare-fun lt!208026 () ListLongMap!7127)

(assert (=> b!459770 (= lt!208028 lt!208026)))

(declare-fun lt!208029 () ListLongMap!7127)

(declare-fun +!1615 (ListLongMap!7127 tuple2!8214) ListLongMap!7127)

(assert (=> b!459770 (= lt!208026 (+!1615 lt!208029 (tuple2!8215 k0!794 v!412)))))

(assert (=> b!459770 (= lt!208028 (getCurrentListMapNoExtraKeys!1759 lt!208023 lt!208031 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459770 (= lt!208029 (getCurrentListMapNoExtraKeys!1759 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208030 () Unit!13365)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 (array!28539 array!28541 (_ BitVec 32) (_ BitVec 32) V!17597 V!17597 (_ BitVec 32) (_ BitVec 64) V!17597 (_ BitVec 32) Int) Unit!13365)

(assert (=> b!459770 (= lt!208030 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459771 () Bool)

(assert (=> b!459771 (= e!268295 (not (= k0!794 (select (arr!13710 _keys!709) from!863))))))

(assert (=> b!459771 (not (= (select (arr!13710 _keys!709) from!863) k0!794))))

(declare-fun lt!208027 () Unit!13365)

(assert (=> b!459771 (= lt!208027 e!268300)))

(declare-fun c!56495 () Bool)

(assert (=> b!459771 (= c!56495 (= (select (arr!13710 _keys!709) from!863) k0!794))))

(declare-fun get!6765 (ValueCell!5841 V!17597) V!17597)

(declare-fun dynLambda!901 (Int (_ BitVec 64)) V!17597)

(assert (=> b!459771 (= lt!208024 (+!1615 lt!208026 (tuple2!8215 (select (arr!13710 _keys!709) from!863) (get!6765 (select (arr!13711 _values!549) from!863) (dynLambda!901 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459772 () Bool)

(assert (=> b!459772 (= e!268301 (and e!268294 mapRes!20203))))

(declare-fun condMapEmpty!20203 () Bool)

(declare-fun mapDefault!20203 () ValueCell!5841)

(assert (=> b!459772 (= condMapEmpty!20203 (= (arr!13711 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5841)) mapDefault!20203)))))

(declare-fun b!459773 () Bool)

(declare-fun res!274794 () Bool)

(assert (=> b!459773 (=> (not res!274794) (not e!268302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459773 (= res!274794 (validMask!0 mask!1025))))

(assert (= (and start!41162 res!274793) b!459773))

(assert (= (and b!459773 res!274794) b!459759))

(assert (= (and b!459759 res!274791) b!459769))

(assert (= (and b!459769 res!274792) b!459765))

(assert (= (and b!459765 res!274796) b!459762))

(assert (= (and b!459762 res!274800) b!459757))

(assert (= (and b!459757 res!274804) b!459756))

(assert (= (and b!459756 res!274797) b!459763))

(assert (= (and b!459763 res!274803) b!459766))

(assert (= (and b!459766 res!274801) b!459760))

(assert (= (and b!459760 res!274802) b!459755))

(assert (= (and b!459755 res!274795) b!459761))

(assert (= (and b!459761 res!274798) b!459770))

(assert (= (and b!459770 (not res!274799)) b!459771))

(assert (= (and b!459771 c!56495) b!459758))

(assert (= (and b!459771 (not c!56495)) b!459768))

(assert (= (and b!459772 condMapEmpty!20203) mapIsEmpty!20203))

(assert (= (and b!459772 (not condMapEmpty!20203)) mapNonEmpty!20203))

(get-info :version)

(assert (= (and mapNonEmpty!20203 ((_ is ValueCellFull!5841) mapValue!20203)) b!459767))

(assert (= (and b!459772 ((_ is ValueCellFull!5841) mapDefault!20203)) b!459764))

(assert (= start!41162 b!459772))

(declare-fun b_lambda!9865 () Bool)

(assert (=> (not b_lambda!9865) (not b!459771)))

(declare-fun t!14194 () Bool)

(declare-fun tb!3867 () Bool)

(assert (=> (and start!41162 (= defaultEntry!557 defaultEntry!557) t!14194) tb!3867))

(declare-fun result!7279 () Bool)

(assert (=> tb!3867 (= result!7279 tp_is_empty!12369)))

(assert (=> b!459771 t!14194))

(declare-fun b_and!19303 () Bool)

(assert (= b_and!19301 (and (=> t!14194 result!7279) b_and!19303)))

(declare-fun m!442999 () Bool)

(assert (=> b!459770 m!442999))

(declare-fun m!443001 () Bool)

(assert (=> b!459770 m!443001))

(declare-fun m!443003 () Bool)

(assert (=> b!459770 m!443003))

(declare-fun m!443005 () Bool)

(assert (=> b!459770 m!443005))

(assert (=> b!459770 m!442999))

(declare-fun m!443007 () Bool)

(assert (=> b!459770 m!443007))

(declare-fun m!443009 () Bool)

(assert (=> b!459770 m!443009))

(declare-fun m!443011 () Bool)

(assert (=> b!459763 m!443011))

(declare-fun m!443013 () Bool)

(assert (=> b!459760 m!443013))

(declare-fun m!443015 () Bool)

(assert (=> b!459761 m!443015))

(declare-fun m!443017 () Bool)

(assert (=> b!459761 m!443017))

(declare-fun m!443019 () Bool)

(assert (=> b!459761 m!443019))

(declare-fun m!443021 () Bool)

(assert (=> mapNonEmpty!20203 m!443021))

(declare-fun m!443023 () Bool)

(assert (=> b!459773 m!443023))

(declare-fun m!443025 () Bool)

(assert (=> b!459758 m!443025))

(assert (=> b!459771 m!442999))

(declare-fun m!443027 () Bool)

(assert (=> b!459771 m!443027))

(declare-fun m!443029 () Bool)

(assert (=> b!459771 m!443029))

(declare-fun m!443031 () Bool)

(assert (=> b!459771 m!443031))

(assert (=> b!459771 m!443029))

(assert (=> b!459771 m!443027))

(declare-fun m!443033 () Bool)

(assert (=> b!459771 m!443033))

(declare-fun m!443035 () Bool)

(assert (=> b!459757 m!443035))

(declare-fun m!443037 () Bool)

(assert (=> b!459766 m!443037))

(declare-fun m!443039 () Bool)

(assert (=> b!459766 m!443039))

(declare-fun m!443041 () Bool)

(assert (=> b!459756 m!443041))

(declare-fun m!443043 () Bool)

(assert (=> b!459769 m!443043))

(declare-fun m!443045 () Bool)

(assert (=> start!41162 m!443045))

(declare-fun m!443047 () Bool)

(assert (=> start!41162 m!443047))

(declare-fun m!443049 () Bool)

(assert (=> b!459765 m!443049))

(check-sat (not b!459758) (not start!41162) (not b!459757) (not b!459766) (not b!459765) (not b_lambda!9865) (not mapNonEmpty!20203) (not b_next!11031) (not b!459769) (not b!459763) (not b!459760) (not b!459773) (not b!459761) (not b!459771) (not b!459770) tp_is_empty!12369 b_and!19303)
(check-sat b_and!19303 (not b_next!11031))
