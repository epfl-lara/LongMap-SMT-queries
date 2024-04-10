; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20474 () Bool)

(assert start!20474)

(declare-fun b_free!5133 () Bool)

(declare-fun b_next!5133 () Bool)

(assert (=> start!20474 (= b_free!5133 (not b_next!5133))))

(declare-fun tp!18431 () Bool)

(declare-fun b_and!11879 () Bool)

(assert (=> start!20474 (= tp!18431 b_and!11879)))

(declare-fun b!203032 () Bool)

(declare-fun res!97453 () Bool)

(declare-fun e!132947 () Bool)

(assert (=> b!203032 (=> (not res!97453) (not e!132947))))

(declare-datatypes ((array!9203 0))(
  ( (array!9204 (arr!4352 (Array (_ BitVec 32) (_ BitVec 64))) (size!4677 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9203)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6299 0))(
  ( (V!6300 (val!2539 Int)) )
))
(declare-datatypes ((ValueCell!2151 0))(
  ( (ValueCellFull!2151 (v!4509 V!6299)) (EmptyCell!2151) )
))
(declare-datatypes ((array!9205 0))(
  ( (array!9206 (arr!4353 (Array (_ BitVec 32) ValueCell!2151)) (size!4678 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9205)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203032 (= res!97453 (and (= (size!4678 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4677 _keys!825) (size!4678 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203033 () Bool)

(declare-fun res!97449 () Bool)

(assert (=> b!203033 (=> (not res!97449) (not e!132947))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203033 (= res!97449 (= (select (arr!4352 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8552 () Bool)

(declare-fun mapRes!8552 () Bool)

(assert (=> mapIsEmpty!8552 mapRes!8552))

(declare-fun b!203034 () Bool)

(declare-fun e!132949 () Bool)

(assert (=> b!203034 (= e!132949 true)))

(declare-datatypes ((tuple2!3850 0))(
  ( (tuple2!3851 (_1!1936 (_ BitVec 64)) (_2!1936 V!6299)) )
))
(declare-datatypes ((List!2754 0))(
  ( (Nil!2751) (Cons!2750 (h!3392 tuple2!3850) (t!7685 List!2754)) )
))
(declare-datatypes ((ListLongMap!2763 0))(
  ( (ListLongMap!2764 (toList!1397 List!2754)) )
))
(declare-fun lt!102208 () ListLongMap!2763)

(declare-fun lt!102212 () ListLongMap!2763)

(declare-fun lt!102217 () tuple2!3850)

(declare-fun +!424 (ListLongMap!2763 tuple2!3850) ListLongMap!2763)

(assert (=> b!203034 (= lt!102208 (+!424 lt!102212 lt!102217))))

(declare-fun lt!102209 () ListLongMap!2763)

(declare-fun v!520 () V!6299)

(declare-fun zeroValue!615 () V!6299)

(declare-datatypes ((Unit!6142 0))(
  ( (Unit!6143) )
))
(declare-fun lt!102215 () Unit!6142)

(declare-fun addCommutativeForDiffKeys!140 (ListLongMap!2763 (_ BitVec 64) V!6299 (_ BitVec 64) V!6299) Unit!6142)

(assert (=> b!203034 (= lt!102215 (addCommutativeForDiffKeys!140 lt!102209 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203035 () Bool)

(declare-fun res!97455 () Bool)

(assert (=> b!203035 (=> (not res!97455) (not e!132947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9203 (_ BitVec 32)) Bool)

(assert (=> b!203035 (= res!97455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203036 () Bool)

(declare-fun e!132950 () Bool)

(assert (=> b!203036 (= e!132947 (not e!132950))))

(declare-fun res!97450 () Bool)

(assert (=> b!203036 (=> res!97450 e!132950)))

(assert (=> b!203036 (= res!97450 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!102214 () ListLongMap!2763)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6299)

(declare-fun getCurrentListMap!975 (array!9203 array!9205 (_ BitVec 32) (_ BitVec 32) V!6299 V!6299 (_ BitVec 32) Int) ListLongMap!2763)

(assert (=> b!203036 (= lt!102214 (getCurrentListMap!975 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102211 () array!9205)

(declare-fun lt!102218 () ListLongMap!2763)

(assert (=> b!203036 (= lt!102218 (getCurrentListMap!975 _keys!825 lt!102211 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102216 () ListLongMap!2763)

(declare-fun lt!102210 () ListLongMap!2763)

(assert (=> b!203036 (and (= lt!102216 lt!102210) (= lt!102210 lt!102216))))

(assert (=> b!203036 (= lt!102210 (+!424 lt!102209 lt!102217))))

(assert (=> b!203036 (= lt!102217 (tuple2!3851 k0!843 v!520))))

(declare-fun lt!102219 () Unit!6142)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 (array!9203 array!9205 (_ BitVec 32) (_ BitVec 32) V!6299 V!6299 (_ BitVec 32) (_ BitVec 64) V!6299 (_ BitVec 32) Int) Unit!6142)

(assert (=> b!203036 (= lt!102219 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!349 (array!9203 array!9205 (_ BitVec 32) (_ BitVec 32) V!6299 V!6299 (_ BitVec 32) Int) ListLongMap!2763)

(assert (=> b!203036 (= lt!102216 (getCurrentListMapNoExtraKeys!349 _keys!825 lt!102211 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203036 (= lt!102211 (array!9206 (store (arr!4353 _values!649) i!601 (ValueCellFull!2151 v!520)) (size!4678 _values!649)))))

(assert (=> b!203036 (= lt!102209 (getCurrentListMapNoExtraKeys!349 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203037 () Bool)

(declare-fun e!132946 () Bool)

(declare-fun e!132945 () Bool)

(assert (=> b!203037 (= e!132946 (and e!132945 mapRes!8552))))

(declare-fun condMapEmpty!8552 () Bool)

(declare-fun mapDefault!8552 () ValueCell!2151)

(assert (=> b!203037 (= condMapEmpty!8552 (= (arr!4353 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2151)) mapDefault!8552)))))

(declare-fun mapNonEmpty!8552 () Bool)

(declare-fun tp!18430 () Bool)

(declare-fun e!132948 () Bool)

(assert (=> mapNonEmpty!8552 (= mapRes!8552 (and tp!18430 e!132948))))

(declare-fun mapKey!8552 () (_ BitVec 32))

(declare-fun mapValue!8552 () ValueCell!2151)

(declare-fun mapRest!8552 () (Array (_ BitVec 32) ValueCell!2151))

(assert (=> mapNonEmpty!8552 (= (arr!4353 _values!649) (store mapRest!8552 mapKey!8552 mapValue!8552))))

(declare-fun res!97452 () Bool)

(assert (=> start!20474 (=> (not res!97452) (not e!132947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20474 (= res!97452 (validMask!0 mask!1149))))

(assert (=> start!20474 e!132947))

(declare-fun array_inv!2875 (array!9205) Bool)

(assert (=> start!20474 (and (array_inv!2875 _values!649) e!132946)))

(assert (=> start!20474 true))

(declare-fun tp_is_empty!4989 () Bool)

(assert (=> start!20474 tp_is_empty!4989))

(declare-fun array_inv!2876 (array!9203) Bool)

(assert (=> start!20474 (array_inv!2876 _keys!825)))

(assert (=> start!20474 tp!18431))

(declare-fun b!203031 () Bool)

(declare-fun res!97451 () Bool)

(assert (=> b!203031 (=> (not res!97451) (not e!132947))))

(declare-datatypes ((List!2755 0))(
  ( (Nil!2752) (Cons!2751 (h!3393 (_ BitVec 64)) (t!7686 List!2755)) )
))
(declare-fun arrayNoDuplicates!0 (array!9203 (_ BitVec 32) List!2755) Bool)

(assert (=> b!203031 (= res!97451 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2752))))

(declare-fun b!203038 () Bool)

(assert (=> b!203038 (= e!132945 tp_is_empty!4989)))

(declare-fun b!203039 () Bool)

(declare-fun res!97454 () Bool)

(assert (=> b!203039 (=> (not res!97454) (not e!132947))))

(assert (=> b!203039 (= res!97454 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4677 _keys!825))))))

(declare-fun b!203040 () Bool)

(assert (=> b!203040 (= e!132950 e!132949)))

(declare-fun res!97456 () Bool)

(assert (=> b!203040 (=> res!97456 e!132949)))

(assert (=> b!203040 (= res!97456 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203040 (= lt!102218 lt!102208)))

(declare-fun lt!102213 () tuple2!3850)

(assert (=> b!203040 (= lt!102208 (+!424 lt!102210 lt!102213))))

(assert (=> b!203040 (= lt!102214 lt!102212)))

(assert (=> b!203040 (= lt!102212 (+!424 lt!102209 lt!102213))))

(assert (=> b!203040 (= lt!102218 (+!424 lt!102216 lt!102213))))

(assert (=> b!203040 (= lt!102213 (tuple2!3851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203041 () Bool)

(declare-fun res!97448 () Bool)

(assert (=> b!203041 (=> (not res!97448) (not e!132947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203041 (= res!97448 (validKeyInArray!0 k0!843))))

(declare-fun b!203042 () Bool)

(assert (=> b!203042 (= e!132948 tp_is_empty!4989)))

(assert (= (and start!20474 res!97452) b!203032))

(assert (= (and b!203032 res!97453) b!203035))

(assert (= (and b!203035 res!97455) b!203031))

(assert (= (and b!203031 res!97451) b!203039))

(assert (= (and b!203039 res!97454) b!203041))

(assert (= (and b!203041 res!97448) b!203033))

(assert (= (and b!203033 res!97449) b!203036))

(assert (= (and b!203036 (not res!97450)) b!203040))

(assert (= (and b!203040 (not res!97456)) b!203034))

(assert (= (and b!203037 condMapEmpty!8552) mapIsEmpty!8552))

(assert (= (and b!203037 (not condMapEmpty!8552)) mapNonEmpty!8552))

(get-info :version)

(assert (= (and mapNonEmpty!8552 ((_ is ValueCellFull!2151) mapValue!8552)) b!203042))

(assert (= (and b!203037 ((_ is ValueCellFull!2151) mapDefault!8552)) b!203038))

(assert (= start!20474 b!203037))

(declare-fun m!230411 () Bool)

(assert (=> b!203040 m!230411))

(declare-fun m!230413 () Bool)

(assert (=> b!203040 m!230413))

(declare-fun m!230415 () Bool)

(assert (=> b!203040 m!230415))

(declare-fun m!230417 () Bool)

(assert (=> start!20474 m!230417))

(declare-fun m!230419 () Bool)

(assert (=> start!20474 m!230419))

(declare-fun m!230421 () Bool)

(assert (=> start!20474 m!230421))

(declare-fun m!230423 () Bool)

(assert (=> b!203034 m!230423))

(declare-fun m!230425 () Bool)

(assert (=> b!203034 m!230425))

(declare-fun m!230427 () Bool)

(assert (=> b!203036 m!230427))

(declare-fun m!230429 () Bool)

(assert (=> b!203036 m!230429))

(declare-fun m!230431 () Bool)

(assert (=> b!203036 m!230431))

(declare-fun m!230433 () Bool)

(assert (=> b!203036 m!230433))

(declare-fun m!230435 () Bool)

(assert (=> b!203036 m!230435))

(declare-fun m!230437 () Bool)

(assert (=> b!203036 m!230437))

(declare-fun m!230439 () Bool)

(assert (=> b!203036 m!230439))

(declare-fun m!230441 () Bool)

(assert (=> b!203033 m!230441))

(declare-fun m!230443 () Bool)

(assert (=> b!203035 m!230443))

(declare-fun m!230445 () Bool)

(assert (=> b!203041 m!230445))

(declare-fun m!230447 () Bool)

(assert (=> b!203031 m!230447))

(declare-fun m!230449 () Bool)

(assert (=> mapNonEmpty!8552 m!230449))

(check-sat (not b!203040) b_and!11879 (not mapNonEmpty!8552) (not b!203035) (not b!203036) (not b!203031) (not b_next!5133) (not b!203034) (not b!203041) tp_is_empty!4989 (not start!20474))
(check-sat b_and!11879 (not b_next!5133))
