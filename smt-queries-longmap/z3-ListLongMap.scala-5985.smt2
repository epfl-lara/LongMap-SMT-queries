; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77718 () Bool)

(assert start!77718)

(declare-fun b_free!16321 () Bool)

(declare-fun b_next!16321 () Bool)

(assert (=> start!77718 (= b_free!16321 (not b_next!16321))))

(declare-fun tp!57225 () Bool)

(declare-fun b_and!26769 () Bool)

(assert (=> start!77718 (= tp!57225 b_and!26769)))

(declare-fun b!906852 () Bool)

(declare-fun res!612091 () Bool)

(declare-fun e!508199 () Bool)

(assert (=> b!906852 (=> (not res!612091) (not e!508199))))

(declare-datatypes ((array!53493 0))(
  ( (array!53494 (arr!25706 (Array (_ BitVec 32) (_ BitVec 64))) (size!26167 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53493)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53493 (_ BitVec 32)) Bool)

(assert (=> b!906852 (= res!612091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!612098 () Bool)

(assert (=> start!77718 (=> (not res!612098) (not e!508199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77718 (= res!612098 (validMask!0 mask!1756))))

(assert (=> start!77718 e!508199))

(declare-datatypes ((V!29951 0))(
  ( (V!29952 (val!9420 Int)) )
))
(declare-datatypes ((ValueCell!8888 0))(
  ( (ValueCellFull!8888 (v!11924 V!29951)) (EmptyCell!8888) )
))
(declare-datatypes ((array!53495 0))(
  ( (array!53496 (arr!25707 (Array (_ BitVec 32) ValueCell!8888)) (size!26168 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53495)

(declare-fun e!508201 () Bool)

(declare-fun array_inv!20174 (array!53495) Bool)

(assert (=> start!77718 (and (array_inv!20174 _values!1152) e!508201)))

(assert (=> start!77718 tp!57225))

(assert (=> start!77718 true))

(declare-fun tp_is_empty!18739 () Bool)

(assert (=> start!77718 tp_is_empty!18739))

(declare-fun array_inv!20175 (array!53493) Bool)

(assert (=> start!77718 (array_inv!20175 _keys!1386)))

(declare-fun b!906853 () Bool)

(declare-fun e!508198 () Bool)

(declare-fun e!508202 () Bool)

(assert (=> b!906853 (= e!508198 e!508202)))

(declare-fun res!612093 () Bool)

(assert (=> b!906853 (=> res!612093 e!508202)))

(declare-datatypes ((tuple2!12288 0))(
  ( (tuple2!12289 (_1!6155 (_ BitVec 64)) (_2!6155 V!29951)) )
))
(declare-datatypes ((List!18074 0))(
  ( (Nil!18071) (Cons!18070 (h!19216 tuple2!12288) (t!25558 List!18074)) )
))
(declare-datatypes ((ListLongMap!10975 0))(
  ( (ListLongMap!10976 (toList!5503 List!18074)) )
))
(declare-fun lt!408921 () ListLongMap!10975)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4507 (ListLongMap!10975 (_ BitVec 64)) Bool)

(assert (=> b!906853 (= res!612093 (not (contains!4507 lt!408921 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29951)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29951)

(declare-fun getCurrentListMap!2711 (array!53493 array!53495 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 32) Int) ListLongMap!10975)

(assert (=> b!906853 (= lt!408921 (getCurrentListMap!2711 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906854 () Bool)

(declare-fun e!508200 () Bool)

(assert (=> b!906854 (= e!508200 (not e!508198))))

(declare-fun res!612096 () Bool)

(assert (=> b!906854 (=> res!612096 e!508198)))

(assert (=> b!906854 (= res!612096 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26167 _keys!1386))))))

(declare-fun lt!408924 () V!29951)

(declare-fun get!13523 (ValueCell!8888 V!29951) V!29951)

(declare-fun dynLambda!1350 (Int (_ BitVec 64)) V!29951)

(assert (=> b!906854 (= lt!408924 (get!13523 (select (arr!25707 _values!1152) i!717) (dynLambda!1350 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906854 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30706 0))(
  ( (Unit!30707) )
))
(declare-fun lt!408925 () Unit!30706)

(declare-fun lemmaKeyInListMapIsInArray!226 (array!53493 array!53495 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 64) Int) Unit!30706)

(assert (=> b!906854 (= lt!408925 (lemmaKeyInListMapIsInArray!226 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906855 () Bool)

(assert (=> b!906855 (= e!508199 e!508200)))

(declare-fun res!612097 () Bool)

(assert (=> b!906855 (=> (not res!612097) (not e!508200))))

(declare-fun lt!408922 () ListLongMap!10975)

(assert (=> b!906855 (= res!612097 (contains!4507 lt!408922 k0!1033))))

(assert (=> b!906855 (= lt!408922 (getCurrentListMap!2711 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906856 () Bool)

(declare-fun e!508205 () Bool)

(assert (=> b!906856 (= e!508205 tp_is_empty!18739)))

(declare-fun b!906857 () Bool)

(declare-fun res!612095 () Bool)

(assert (=> b!906857 (=> (not res!612095) (not e!508199))))

(declare-datatypes ((List!18075 0))(
  ( (Nil!18072) (Cons!18071 (h!19217 (_ BitVec 64)) (t!25559 List!18075)) )
))
(declare-fun arrayNoDuplicates!0 (array!53493 (_ BitVec 32) List!18075) Bool)

(assert (=> b!906857 (= res!612095 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18072))))

(declare-fun b!906858 () Bool)

(assert (=> b!906858 (= e!508202 true)))

(declare-fun apply!478 (ListLongMap!10975 (_ BitVec 64)) V!29951)

(assert (=> b!906858 (= (apply!478 lt!408922 k0!1033) lt!408924)))

(declare-fun lt!408923 () Unit!30706)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!39 (array!53493 array!53495 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 64) V!29951 (_ BitVec 32) Int) Unit!30706)

(assert (=> b!906858 (= lt!408923 (lemmaListMapApplyFromThenApplyFromZero!39 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408924 i!717 defaultEntry!1160))))

(declare-fun b!906859 () Bool)

(declare-fun res!612090 () Bool)

(assert (=> b!906859 (=> (not res!612090) (not e!508200))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906859 (= res!612090 (inRange!0 i!717 mask!1756))))

(declare-fun b!906860 () Bool)

(declare-fun res!612092 () Bool)

(assert (=> b!906860 (=> res!612092 e!508202)))

(assert (=> b!906860 (= res!612092 (not (= (apply!478 lt!408921 k0!1033) lt!408924)))))

(declare-fun b!906861 () Bool)

(declare-fun e!508204 () Bool)

(assert (=> b!906861 (= e!508204 tp_is_empty!18739)))

(declare-fun b!906862 () Bool)

(declare-fun res!612099 () Bool)

(assert (=> b!906862 (=> (not res!612099) (not e!508199))))

(assert (=> b!906862 (= res!612099 (and (= (size!26168 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26167 _keys!1386) (size!26168 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29821 () Bool)

(declare-fun mapRes!29821 () Bool)

(assert (=> mapIsEmpty!29821 mapRes!29821))

(declare-fun b!906863 () Bool)

(assert (=> b!906863 (= e!508201 (and e!508205 mapRes!29821))))

(declare-fun condMapEmpty!29821 () Bool)

(declare-fun mapDefault!29821 () ValueCell!8888)

(assert (=> b!906863 (= condMapEmpty!29821 (= (arr!25707 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8888)) mapDefault!29821)))))

(declare-fun b!906864 () Bool)

(declare-fun res!612094 () Bool)

(assert (=> b!906864 (=> (not res!612094) (not e!508200))))

(assert (=> b!906864 (= res!612094 (and (= (select (arr!25706 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29821 () Bool)

(declare-fun tp!57226 () Bool)

(assert (=> mapNonEmpty!29821 (= mapRes!29821 (and tp!57226 e!508204))))

(declare-fun mapRest!29821 () (Array (_ BitVec 32) ValueCell!8888))

(declare-fun mapKey!29821 () (_ BitVec 32))

(declare-fun mapValue!29821 () ValueCell!8888)

(assert (=> mapNonEmpty!29821 (= (arr!25707 _values!1152) (store mapRest!29821 mapKey!29821 mapValue!29821))))

(assert (= (and start!77718 res!612098) b!906862))

(assert (= (and b!906862 res!612099) b!906852))

(assert (= (and b!906852 res!612091) b!906857))

(assert (= (and b!906857 res!612095) b!906855))

(assert (= (and b!906855 res!612097) b!906859))

(assert (= (and b!906859 res!612090) b!906864))

(assert (= (and b!906864 res!612094) b!906854))

(assert (= (and b!906854 (not res!612096)) b!906853))

(assert (= (and b!906853 (not res!612093)) b!906860))

(assert (= (and b!906860 (not res!612092)) b!906858))

(assert (= (and b!906863 condMapEmpty!29821) mapIsEmpty!29821))

(assert (= (and b!906863 (not condMapEmpty!29821)) mapNonEmpty!29821))

(get-info :version)

(assert (= (and mapNonEmpty!29821 ((_ is ValueCellFull!8888) mapValue!29821)) b!906861))

(assert (= (and b!906863 ((_ is ValueCellFull!8888) mapDefault!29821)) b!906856))

(assert (= start!77718 b!906863))

(declare-fun b_lambda!13177 () Bool)

(assert (=> (not b_lambda!13177) (not b!906854)))

(declare-fun t!25557 () Bool)

(declare-fun tb!5335 () Bool)

(assert (=> (and start!77718 (= defaultEntry!1160 defaultEntry!1160) t!25557) tb!5335))

(declare-fun result!10473 () Bool)

(assert (=> tb!5335 (= result!10473 tp_is_empty!18739)))

(assert (=> b!906854 t!25557))

(declare-fun b_and!26771 () Bool)

(assert (= b_and!26769 (and (=> t!25557 result!10473) b_and!26771)))

(declare-fun m!841697 () Bool)

(assert (=> b!906852 m!841697))

(declare-fun m!841699 () Bool)

(assert (=> b!906864 m!841699))

(declare-fun m!841701 () Bool)

(assert (=> mapNonEmpty!29821 m!841701))

(declare-fun m!841703 () Bool)

(assert (=> b!906860 m!841703))

(declare-fun m!841705 () Bool)

(assert (=> b!906859 m!841705))

(declare-fun m!841707 () Bool)

(assert (=> b!906854 m!841707))

(declare-fun m!841709 () Bool)

(assert (=> b!906854 m!841709))

(declare-fun m!841711 () Bool)

(assert (=> b!906854 m!841711))

(declare-fun m!841713 () Bool)

(assert (=> b!906854 m!841713))

(assert (=> b!906854 m!841707))

(assert (=> b!906854 m!841711))

(declare-fun m!841715 () Bool)

(assert (=> b!906854 m!841715))

(declare-fun m!841717 () Bool)

(assert (=> start!77718 m!841717))

(declare-fun m!841719 () Bool)

(assert (=> start!77718 m!841719))

(declare-fun m!841721 () Bool)

(assert (=> start!77718 m!841721))

(declare-fun m!841723 () Bool)

(assert (=> b!906853 m!841723))

(declare-fun m!841725 () Bool)

(assert (=> b!906853 m!841725))

(declare-fun m!841727 () Bool)

(assert (=> b!906855 m!841727))

(declare-fun m!841729 () Bool)

(assert (=> b!906855 m!841729))

(declare-fun m!841731 () Bool)

(assert (=> b!906858 m!841731))

(declare-fun m!841733 () Bool)

(assert (=> b!906858 m!841733))

(declare-fun m!841735 () Bool)

(assert (=> b!906857 m!841735))

(check-sat b_and!26771 (not b!906853) (not mapNonEmpty!29821) (not b!906859) (not b!906854) (not b!906860) (not b!906852) tp_is_empty!18739 (not b_lambda!13177) (not b_next!16321) (not start!77718) (not b!906858) (not b!906857) (not b!906855))
(check-sat b_and!26771 (not b_next!16321))
