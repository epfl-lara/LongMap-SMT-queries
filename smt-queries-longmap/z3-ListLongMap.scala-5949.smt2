; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77502 () Bool)

(assert start!77502)

(declare-fun b_free!16105 () Bool)

(declare-fun b_next!16105 () Bool)

(assert (=> start!77502 (= b_free!16105 (not b_next!16105))))

(declare-fun tp!56578 () Bool)

(declare-fun b_and!26445 () Bool)

(assert (=> start!77502 (= tp!56578 b_and!26445)))

(declare-fun res!609318 () Bool)

(declare-fun e!505890 () Bool)

(assert (=> start!77502 (=> (not res!609318) (not e!505890))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77502 (= res!609318 (validMask!0 mask!1756))))

(assert (=> start!77502 e!505890))

(declare-datatypes ((V!29663 0))(
  ( (V!29664 (val!9312 Int)) )
))
(declare-datatypes ((ValueCell!8780 0))(
  ( (ValueCellFull!8780 (v!11816 V!29663)) (EmptyCell!8780) )
))
(declare-datatypes ((array!53087 0))(
  ( (array!53088 (arr!25503 (Array (_ BitVec 32) ValueCell!8780)) (size!25964 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53087)

(declare-fun e!505889 () Bool)

(declare-fun array_inv!20044 (array!53087) Bool)

(assert (=> start!77502 (and (array_inv!20044 _values!1152) e!505889)))

(assert (=> start!77502 tp!56578))

(assert (=> start!77502 true))

(declare-fun tp_is_empty!18523 () Bool)

(assert (=> start!77502 tp_is_empty!18523))

(declare-datatypes ((array!53089 0))(
  ( (array!53090 (arr!25504 (Array (_ BitVec 32) (_ BitVec 64))) (size!25965 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53089)

(declare-fun array_inv!20045 (array!53089) Bool)

(assert (=> start!77502 (array_inv!20045 _keys!1386)))

(declare-fun mapIsEmpty!29497 () Bool)

(declare-fun mapRes!29497 () Bool)

(assert (=> mapIsEmpty!29497 mapRes!29497))

(declare-fun b!902997 () Bool)

(declare-fun e!505891 () Bool)

(assert (=> b!902997 (= e!505891 tp_is_empty!18523)))

(declare-fun mapNonEmpty!29497 () Bool)

(declare-fun tp!56577 () Bool)

(assert (=> mapNonEmpty!29497 (= mapRes!29497 (and tp!56577 e!505891))))

(declare-fun mapRest!29497 () (Array (_ BitVec 32) ValueCell!8780))

(declare-fun mapValue!29497 () ValueCell!8780)

(declare-fun mapKey!29497 () (_ BitVec 32))

(assert (=> mapNonEmpty!29497 (= (arr!25503 _values!1152) (store mapRest!29497 mapKey!29497 mapValue!29497))))

(declare-fun b!902998 () Bool)

(declare-fun res!609315 () Bool)

(assert (=> b!902998 (=> (not res!609315) (not e!505890))))

(declare-datatypes ((List!17925 0))(
  ( (Nil!17922) (Cons!17921 (h!19067 (_ BitVec 64)) (t!25299 List!17925)) )
))
(declare-fun arrayNoDuplicates!0 (array!53089 (_ BitVec 32) List!17925) Bool)

(assert (=> b!902998 (= res!609315 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17922))))

(declare-fun b!902999 () Bool)

(declare-fun e!505892 () Bool)

(assert (=> b!902999 (= e!505892 tp_is_empty!18523)))

(declare-fun b!903000 () Bool)

(assert (=> b!903000 (= e!505890 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29663)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29663)

(declare-fun lt!407743 () Bool)

(declare-datatypes ((tuple2!12118 0))(
  ( (tuple2!12119 (_1!6070 (_ BitVec 64)) (_2!6070 V!29663)) )
))
(declare-datatypes ((List!17926 0))(
  ( (Nil!17923) (Cons!17922 (h!19068 tuple2!12118) (t!25300 List!17926)) )
))
(declare-datatypes ((ListLongMap!10805 0))(
  ( (ListLongMap!10806 (toList!5418 List!17926)) )
))
(declare-fun contains!4429 (ListLongMap!10805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2633 (array!53089 array!53087 (_ BitVec 32) (_ BitVec 32) V!29663 V!29663 (_ BitVec 32) Int) ListLongMap!10805)

(assert (=> b!903000 (= lt!407743 (contains!4429 (getCurrentListMap!2633 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903001 () Bool)

(assert (=> b!903001 (= e!505889 (and e!505892 mapRes!29497))))

(declare-fun condMapEmpty!29497 () Bool)

(declare-fun mapDefault!29497 () ValueCell!8780)

(assert (=> b!903001 (= condMapEmpty!29497 (= (arr!25503 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8780)) mapDefault!29497)))))

(declare-fun b!903002 () Bool)

(declare-fun res!609316 () Bool)

(assert (=> b!903002 (=> (not res!609316) (not e!505890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53089 (_ BitVec 32)) Bool)

(assert (=> b!903002 (= res!609316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903003 () Bool)

(declare-fun res!609317 () Bool)

(assert (=> b!903003 (=> (not res!609317) (not e!505890))))

(assert (=> b!903003 (= res!609317 (and (= (size!25964 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25965 _keys!1386) (size!25964 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77502 res!609318) b!903003))

(assert (= (and b!903003 res!609317) b!903002))

(assert (= (and b!903002 res!609316) b!902998))

(assert (= (and b!902998 res!609315) b!903000))

(assert (= (and b!903001 condMapEmpty!29497) mapIsEmpty!29497))

(assert (= (and b!903001 (not condMapEmpty!29497)) mapNonEmpty!29497))

(get-info :version)

(assert (= (and mapNonEmpty!29497 ((_ is ValueCellFull!8780) mapValue!29497)) b!902997))

(assert (= (and b!903001 ((_ is ValueCellFull!8780) mapDefault!29497)) b!902999))

(assert (= start!77502 b!903001))

(declare-fun m!838211 () Bool)

(assert (=> b!903000 m!838211))

(assert (=> b!903000 m!838211))

(declare-fun m!838213 () Bool)

(assert (=> b!903000 m!838213))

(declare-fun m!838215 () Bool)

(assert (=> start!77502 m!838215))

(declare-fun m!838217 () Bool)

(assert (=> start!77502 m!838217))

(declare-fun m!838219 () Bool)

(assert (=> start!77502 m!838219))

(declare-fun m!838221 () Bool)

(assert (=> b!902998 m!838221))

(declare-fun m!838223 () Bool)

(assert (=> b!903002 m!838223))

(declare-fun m!838225 () Bool)

(assert (=> mapNonEmpty!29497 m!838225))

(check-sat (not b!903002) b_and!26445 (not b!902998) tp_is_empty!18523 (not mapNonEmpty!29497) (not start!77502) (not b_next!16105) (not b!903000))
(check-sat b_and!26445 (not b_next!16105))
