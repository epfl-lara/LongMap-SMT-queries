; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77952 () Bool)

(assert start!77952)

(declare-fun b_free!16513 () Bool)

(declare-fun b_next!16513 () Bool)

(assert (=> start!77952 (= b_free!16513 (not b_next!16513))))

(declare-fun tp!57808 () Bool)

(declare-fun b_and!27057 () Bool)

(assert (=> start!77952 (= tp!57808 b_and!27057)))

(declare-fun mapIsEmpty!30115 () Bool)

(declare-fun mapRes!30115 () Bool)

(assert (=> mapIsEmpty!30115 mapRes!30115))

(declare-fun b!910035 () Bool)

(declare-fun e!510212 () Bool)

(declare-fun tp_is_empty!18931 () Bool)

(assert (=> b!910035 (= e!510212 tp_is_empty!18931)))

(declare-fun b!910036 () Bool)

(declare-fun e!510214 () Bool)

(assert (=> b!910036 (= e!510214 (and e!510212 mapRes!30115))))

(declare-fun condMapEmpty!30115 () Bool)

(declare-datatypes ((V!30207 0))(
  ( (V!30208 (val!9516 Int)) )
))
(declare-datatypes ((ValueCell!8984 0))(
  ( (ValueCellFull!8984 (v!12023 V!30207)) (EmptyCell!8984) )
))
(declare-datatypes ((array!53865 0))(
  ( (array!53866 (arr!25890 (Array (_ BitVec 32) ValueCell!8984)) (size!26351 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53865)

(declare-fun mapDefault!30115 () ValueCell!8984)

(assert (=> b!910036 (= condMapEmpty!30115 (= (arr!25890 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8984)) mapDefault!30115)))))

(declare-fun mapNonEmpty!30115 () Bool)

(declare-fun tp!57807 () Bool)

(declare-fun e!510215 () Bool)

(assert (=> mapNonEmpty!30115 (= mapRes!30115 (and tp!57807 e!510215))))

(declare-fun mapKey!30115 () (_ BitVec 32))

(declare-fun mapValue!30115 () ValueCell!8984)

(declare-fun mapRest!30115 () (Array (_ BitVec 32) ValueCell!8984))

(assert (=> mapNonEmpty!30115 (= (arr!25890 _values!1152) (store mapRest!30115 mapKey!30115 mapValue!30115))))

(declare-fun b!910037 () Bool)

(declare-fun res!614169 () Bool)

(declare-fun e!510213 () Bool)

(assert (=> b!910037 (=> (not res!614169) (not e!510213))))

(declare-datatypes ((array!53867 0))(
  ( (array!53868 (arr!25891 (Array (_ BitVec 32) (_ BitVec 64))) (size!26352 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53867)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53867 (_ BitVec 32)) Bool)

(assert (=> b!910037 (= res!614169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910038 () Bool)

(declare-fun res!614170 () Bool)

(assert (=> b!910038 (=> (not res!614170) (not e!510213))))

(declare-datatypes ((List!18218 0))(
  ( (Nil!18215) (Cons!18214 (h!19360 (_ BitVec 64)) (t!25792 List!18218)) )
))
(declare-fun arrayNoDuplicates!0 (array!53867 (_ BitVec 32) List!18218) Bool)

(assert (=> b!910038 (= res!614170 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18215))))

(declare-fun b!910039 () Bool)

(assert (=> b!910039 (= e!510213 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30207)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30207)

(declare-fun lt!409938 () Bool)

(declare-datatypes ((tuple2!12434 0))(
  ( (tuple2!12435 (_1!6228 (_ BitVec 64)) (_2!6228 V!30207)) )
))
(declare-datatypes ((List!18219 0))(
  ( (Nil!18216) (Cons!18215 (h!19361 tuple2!12434) (t!25793 List!18219)) )
))
(declare-datatypes ((ListLongMap!11121 0))(
  ( (ListLongMap!11122 (toList!5576 List!18219)) )
))
(declare-fun contains!4576 (ListLongMap!11121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2778 (array!53867 array!53865 (_ BitVec 32) (_ BitVec 32) V!30207 V!30207 (_ BitVec 32) Int) ListLongMap!11121)

(assert (=> b!910039 (= lt!409938 (contains!4576 (getCurrentListMap!2778 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910041 () Bool)

(declare-fun res!614168 () Bool)

(assert (=> b!910041 (=> (not res!614168) (not e!510213))))

(assert (=> b!910041 (= res!614168 (and (= (size!26351 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26352 _keys!1386) (size!26351 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910040 () Bool)

(assert (=> b!910040 (= e!510215 tp_is_empty!18931)))

(declare-fun res!614167 () Bool)

(assert (=> start!77952 (=> (not res!614167) (not e!510213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77952 (= res!614167 (validMask!0 mask!1756))))

(assert (=> start!77952 e!510213))

(declare-fun array_inv!20300 (array!53865) Bool)

(assert (=> start!77952 (and (array_inv!20300 _values!1152) e!510214)))

(assert (=> start!77952 tp!57808))

(assert (=> start!77952 true))

(assert (=> start!77952 tp_is_empty!18931))

(declare-fun array_inv!20301 (array!53867) Bool)

(assert (=> start!77952 (array_inv!20301 _keys!1386)))

(assert (= (and start!77952 res!614167) b!910041))

(assert (= (and b!910041 res!614168) b!910037))

(assert (= (and b!910037 res!614169) b!910038))

(assert (= (and b!910038 res!614170) b!910039))

(assert (= (and b!910036 condMapEmpty!30115) mapIsEmpty!30115))

(assert (= (and b!910036 (not condMapEmpty!30115)) mapNonEmpty!30115))

(get-info :version)

(assert (= (and mapNonEmpty!30115 ((_ is ValueCellFull!8984) mapValue!30115)) b!910040))

(assert (= (and b!910036 ((_ is ValueCellFull!8984) mapDefault!30115)) b!910035))

(assert (= start!77952 b!910036))

(declare-fun m!844559 () Bool)

(assert (=> b!910039 m!844559))

(assert (=> b!910039 m!844559))

(declare-fun m!844561 () Bool)

(assert (=> b!910039 m!844561))

(declare-fun m!844563 () Bool)

(assert (=> b!910037 m!844563))

(declare-fun m!844565 () Bool)

(assert (=> b!910038 m!844565))

(declare-fun m!844567 () Bool)

(assert (=> start!77952 m!844567))

(declare-fun m!844569 () Bool)

(assert (=> start!77952 m!844569))

(declare-fun m!844571 () Bool)

(assert (=> start!77952 m!844571))

(declare-fun m!844573 () Bool)

(assert (=> mapNonEmpty!30115 m!844573))

(check-sat (not b!910037) (not b_next!16513) b_and!27057 (not mapNonEmpty!30115) tp_is_empty!18931 (not start!77952) (not b!910038) (not b!910039))
(check-sat b_and!27057 (not b_next!16513))
