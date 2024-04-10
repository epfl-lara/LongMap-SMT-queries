; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39294 () Bool)

(assert start!39294)

(declare-fun b_free!9561 () Bool)

(declare-fun b_next!9561 () Bool)

(assert (=> start!39294 (= b_free!9561 (not b_next!9561))))

(declare-fun tp!34211 () Bool)

(declare-fun b_and!16997 () Bool)

(assert (=> start!39294 (= tp!34211 b_and!16997)))

(declare-fun b!415837 () Bool)

(declare-fun e!248324 () Bool)

(declare-fun e!248328 () Bool)

(assert (=> b!415837 (= e!248324 e!248328)))

(declare-fun res!241976 () Bool)

(assert (=> b!415837 (=> (not res!241976) (not e!248328))))

(declare-datatypes ((array!25283 0))(
  ( (array!25284 (arr!12091 (Array (_ BitVec 32) (_ BitVec 64))) (size!12443 (_ BitVec 32))) )
))
(declare-fun lt!190354 () array!25283)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25283 (_ BitVec 32)) Bool)

(assert (=> b!415837 (= res!241976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190354 mask!1025))))

(declare-fun _keys!709 () array!25283)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415837 (= lt!190354 (array!25284 (store (arr!12091 _keys!709) i!563 k0!794) (size!12443 _keys!709)))))

(declare-fun b!415839 () Bool)

(declare-fun e!248325 () Bool)

(declare-fun tp_is_empty!10713 () Bool)

(assert (=> b!415839 (= e!248325 tp_is_empty!10713)))

(declare-fun b!415840 () Bool)

(declare-fun e!248330 () Bool)

(assert (=> b!415840 (= e!248328 e!248330)))

(declare-fun res!241966 () Bool)

(assert (=> b!415840 (=> (not res!241966) (not e!248330))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!415840 (= res!241966 (= from!863 i!563))))

(declare-datatypes ((V!15389 0))(
  ( (V!15390 (val!5401 Int)) )
))
(declare-fun minValue!515 () V!15389)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15389)

(declare-datatypes ((tuple2!7038 0))(
  ( (tuple2!7039 (_1!3530 (_ BitVec 64)) (_2!3530 V!15389)) )
))
(declare-datatypes ((List!7059 0))(
  ( (Nil!7056) (Cons!7055 (h!7911 tuple2!7038) (t!12285 List!7059)) )
))
(declare-datatypes ((ListLongMap!5951 0))(
  ( (ListLongMap!5952 (toList!2991 List!7059)) )
))
(declare-fun lt!190355 () ListLongMap!5951)

(declare-datatypes ((ValueCell!5013 0))(
  ( (ValueCellFull!5013 (v!7648 V!15389)) (EmptyCell!5013) )
))
(declare-datatypes ((array!25285 0))(
  ( (array!25286 (arr!12092 (Array (_ BitVec 32) ValueCell!5013)) (size!12444 (_ BitVec 32))) )
))
(declare-fun lt!190358 () array!25285)

(declare-fun getCurrentListMapNoExtraKeys!1197 (array!25283 array!25285 (_ BitVec 32) (_ BitVec 32) V!15389 V!15389 (_ BitVec 32) Int) ListLongMap!5951)

(assert (=> b!415840 (= lt!190355 (getCurrentListMapNoExtraKeys!1197 lt!190354 lt!190358 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25285)

(declare-fun v!412 () V!15389)

(assert (=> b!415840 (= lt!190358 (array!25286 (store (arr!12092 _values!549) i!563 (ValueCellFull!5013 v!412)) (size!12444 _values!549)))))

(declare-fun lt!190357 () ListLongMap!5951)

(assert (=> b!415840 (= lt!190357 (getCurrentListMapNoExtraKeys!1197 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415841 () Bool)

(declare-fun res!241977 () Bool)

(assert (=> b!415841 (=> (not res!241977) (not e!248328))))

(assert (=> b!415841 (= res!241977 (bvsle from!863 i!563))))

(declare-fun b!415842 () Bool)

(declare-fun res!241964 () Bool)

(assert (=> b!415842 (=> (not res!241964) (not e!248324))))

(assert (=> b!415842 (= res!241964 (and (= (size!12444 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12443 _keys!709) (size!12444 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!28862 () ListLongMap!5951)

(declare-fun c!55055 () Bool)

(declare-fun bm!28858 () Bool)

(assert (=> bm!28858 (= call!28862 (getCurrentListMapNoExtraKeys!1197 (ite c!55055 lt!190354 _keys!709) (ite c!55055 lt!190358 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415843 () Bool)

(declare-fun res!241969 () Bool)

(assert (=> b!415843 (=> (not res!241969) (not e!248324))))

(assert (=> b!415843 (= res!241969 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12443 _keys!709))))))

(declare-fun b!415844 () Bool)

(declare-fun res!241975 () Bool)

(assert (=> b!415844 (=> (not res!241975) (not e!248324))))

(assert (=> b!415844 (= res!241975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415845 () Bool)

(declare-fun res!241968 () Bool)

(assert (=> b!415845 (=> (not res!241968) (not e!248324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415845 (= res!241968 (validKeyInArray!0 k0!794))))

(declare-fun b!415846 () Bool)

(declare-fun res!241973 () Bool)

(assert (=> b!415846 (=> (not res!241973) (not e!248324))))

(assert (=> b!415846 (= res!241973 (or (= (select (arr!12091 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12091 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!28861 () ListLongMap!5951)

(declare-fun bm!28859 () Bool)

(assert (=> bm!28859 (= call!28861 (getCurrentListMapNoExtraKeys!1197 (ite c!55055 _keys!709 lt!190354) (ite c!55055 _values!549 lt!190358) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!248331 () Bool)

(declare-fun b!415847 () Bool)

(declare-fun +!1194 (ListLongMap!5951 tuple2!7038) ListLongMap!5951)

(assert (=> b!415847 (= e!248331 (= call!28862 (+!1194 call!28861 (tuple2!7039 k0!794 v!412))))))

(declare-fun mapNonEmpty!17691 () Bool)

(declare-fun mapRes!17691 () Bool)

(declare-fun tp!34212 () Bool)

(declare-fun e!248326 () Bool)

(assert (=> mapNonEmpty!17691 (= mapRes!17691 (and tp!34212 e!248326))))

(declare-fun mapValue!17691 () ValueCell!5013)

(declare-fun mapRest!17691 () (Array (_ BitVec 32) ValueCell!5013))

(declare-fun mapKey!17691 () (_ BitVec 32))

(assert (=> mapNonEmpty!17691 (= (arr!12092 _values!549) (store mapRest!17691 mapKey!17691 mapValue!17691))))

(declare-fun b!415848 () Bool)

(declare-fun e!248327 () Bool)

(assert (=> b!415848 (= e!248327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12443 _keys!709))))))

(declare-fun get!5972 (ValueCell!5013 V!15389) V!15389)

(declare-fun dynLambda!671 (Int (_ BitVec 64)) V!15389)

(assert (=> b!415848 (= lt!190355 (+!1194 (getCurrentListMapNoExtraKeys!1197 lt!190354 lt!190358 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7039 (select (arr!12091 lt!190354) from!863) (get!5972 (select (arr!12092 lt!190358) from!863) (dynLambda!671 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415838 () Bool)

(declare-fun e!248323 () Bool)

(assert (=> b!415838 (= e!248323 (and e!248325 mapRes!17691))))

(declare-fun condMapEmpty!17691 () Bool)

(declare-fun mapDefault!17691 () ValueCell!5013)

(assert (=> b!415838 (= condMapEmpty!17691 (= (arr!12092 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5013)) mapDefault!17691)))))

(declare-fun res!241965 () Bool)

(assert (=> start!39294 (=> (not res!241965) (not e!248324))))

(assert (=> start!39294 (= res!241965 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12443 _keys!709))))))

(assert (=> start!39294 e!248324))

(assert (=> start!39294 tp_is_empty!10713))

(assert (=> start!39294 tp!34211))

(assert (=> start!39294 true))

(declare-fun array_inv!8820 (array!25285) Bool)

(assert (=> start!39294 (and (array_inv!8820 _values!549) e!248323)))

(declare-fun array_inv!8821 (array!25283) Bool)

(assert (=> start!39294 (array_inv!8821 _keys!709)))

(declare-fun b!415849 () Bool)

(assert (=> b!415849 (= e!248326 tp_is_empty!10713)))

(declare-fun b!415850 () Bool)

(declare-fun res!241967 () Bool)

(assert (=> b!415850 (=> (not res!241967) (not e!248324))))

(declare-fun arrayContainsKey!0 (array!25283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415850 (= res!241967 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415851 () Bool)

(declare-fun res!241974 () Bool)

(assert (=> b!415851 (=> (not res!241974) (not e!248324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415851 (= res!241974 (validMask!0 mask!1025))))

(declare-fun b!415852 () Bool)

(assert (=> b!415852 (= e!248331 (= call!28861 call!28862))))

(declare-fun b!415853 () Bool)

(declare-fun res!241970 () Bool)

(assert (=> b!415853 (=> (not res!241970) (not e!248324))))

(declare-datatypes ((List!7060 0))(
  ( (Nil!7057) (Cons!7056 (h!7912 (_ BitVec 64)) (t!12286 List!7060)) )
))
(declare-fun arrayNoDuplicates!0 (array!25283 (_ BitVec 32) List!7060) Bool)

(assert (=> b!415853 (= res!241970 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7057))))

(declare-fun b!415854 () Bool)

(assert (=> b!415854 (= e!248330 (not e!248327))))

(declare-fun res!241971 () Bool)

(assert (=> b!415854 (=> res!241971 e!248327)))

(assert (=> b!415854 (= res!241971 (validKeyInArray!0 (select (arr!12091 _keys!709) from!863)))))

(assert (=> b!415854 e!248331))

(assert (=> b!415854 (= c!55055 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12294 0))(
  ( (Unit!12295) )
))
(declare-fun lt!190356 () Unit!12294)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!405 (array!25283 array!25285 (_ BitVec 32) (_ BitVec 32) V!15389 V!15389 (_ BitVec 32) (_ BitVec 64) V!15389 (_ BitVec 32) Int) Unit!12294)

(assert (=> b!415854 (= lt!190356 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!405 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17691 () Bool)

(assert (=> mapIsEmpty!17691 mapRes!17691))

(declare-fun b!415855 () Bool)

(declare-fun res!241972 () Bool)

(assert (=> b!415855 (=> (not res!241972) (not e!248328))))

(assert (=> b!415855 (= res!241972 (arrayNoDuplicates!0 lt!190354 #b00000000000000000000000000000000 Nil!7057))))

(assert (= (and start!39294 res!241965) b!415851))

(assert (= (and b!415851 res!241974) b!415842))

(assert (= (and b!415842 res!241964) b!415844))

(assert (= (and b!415844 res!241975) b!415853))

(assert (= (and b!415853 res!241970) b!415843))

(assert (= (and b!415843 res!241969) b!415845))

(assert (= (and b!415845 res!241968) b!415846))

(assert (= (and b!415846 res!241973) b!415850))

(assert (= (and b!415850 res!241967) b!415837))

(assert (= (and b!415837 res!241976) b!415855))

(assert (= (and b!415855 res!241972) b!415841))

(assert (= (and b!415841 res!241977) b!415840))

(assert (= (and b!415840 res!241966) b!415854))

(assert (= (and b!415854 c!55055) b!415847))

(assert (= (and b!415854 (not c!55055)) b!415852))

(assert (= (or b!415847 b!415852) bm!28858))

(assert (= (or b!415847 b!415852) bm!28859))

(assert (= (and b!415854 (not res!241971)) b!415848))

(assert (= (and b!415838 condMapEmpty!17691) mapIsEmpty!17691))

(assert (= (and b!415838 (not condMapEmpty!17691)) mapNonEmpty!17691))

(get-info :version)

(assert (= (and mapNonEmpty!17691 ((_ is ValueCellFull!5013) mapValue!17691)) b!415849))

(assert (= (and b!415838 ((_ is ValueCellFull!5013) mapDefault!17691)) b!415839))

(assert (= start!39294 b!415838))

(declare-fun b_lambda!8865 () Bool)

(assert (=> (not b_lambda!8865) (not b!415848)))

(declare-fun t!12284 () Bool)

(declare-fun tb!3183 () Bool)

(assert (=> (and start!39294 (= defaultEntry!557 defaultEntry!557) t!12284) tb!3183))

(declare-fun result!5893 () Bool)

(assert (=> tb!3183 (= result!5893 tp_is_empty!10713)))

(assert (=> b!415848 t!12284))

(declare-fun b_and!16999 () Bool)

(assert (= b_and!16997 (and (=> t!12284 result!5893) b_and!16999)))

(declare-fun m!404939 () Bool)

(assert (=> b!415837 m!404939))

(declare-fun m!404941 () Bool)

(assert (=> b!415837 m!404941))

(declare-fun m!404943 () Bool)

(assert (=> bm!28859 m!404943))

(declare-fun m!404945 () Bool)

(assert (=> mapNonEmpty!17691 m!404945))

(declare-fun m!404947 () Bool)

(assert (=> b!415855 m!404947))

(declare-fun m!404949 () Bool)

(assert (=> b!415846 m!404949))

(declare-fun m!404951 () Bool)

(assert (=> bm!28858 m!404951))

(declare-fun m!404953 () Bool)

(assert (=> b!415844 m!404953))

(declare-fun m!404955 () Bool)

(assert (=> b!415848 m!404955))

(declare-fun m!404957 () Bool)

(assert (=> b!415848 m!404957))

(assert (=> b!415848 m!404955))

(declare-fun m!404959 () Bool)

(assert (=> b!415848 m!404959))

(declare-fun m!404961 () Bool)

(assert (=> b!415848 m!404961))

(declare-fun m!404963 () Bool)

(assert (=> b!415848 m!404963))

(assert (=> b!415848 m!404963))

(declare-fun m!404965 () Bool)

(assert (=> b!415848 m!404965))

(assert (=> b!415848 m!404957))

(declare-fun m!404967 () Bool)

(assert (=> b!415847 m!404967))

(declare-fun m!404969 () Bool)

(assert (=> b!415853 m!404969))

(declare-fun m!404971 () Bool)

(assert (=> b!415840 m!404971))

(declare-fun m!404973 () Bool)

(assert (=> b!415840 m!404973))

(declare-fun m!404975 () Bool)

(assert (=> b!415840 m!404975))

(declare-fun m!404977 () Bool)

(assert (=> start!39294 m!404977))

(declare-fun m!404979 () Bool)

(assert (=> start!39294 m!404979))

(declare-fun m!404981 () Bool)

(assert (=> b!415845 m!404981))

(declare-fun m!404983 () Bool)

(assert (=> b!415854 m!404983))

(assert (=> b!415854 m!404983))

(declare-fun m!404985 () Bool)

(assert (=> b!415854 m!404985))

(declare-fun m!404987 () Bool)

(assert (=> b!415854 m!404987))

(declare-fun m!404989 () Bool)

(assert (=> b!415850 m!404989))

(declare-fun m!404991 () Bool)

(assert (=> b!415851 m!404991))

(check-sat (not bm!28859) (not b_lambda!8865) (not b!415845) (not b_next!9561) (not b!415853) (not b!415847) (not b!415854) (not b!415851) (not bm!28858) (not b!415837) (not b!415855) b_and!16999 (not start!39294) (not mapNonEmpty!17691) (not b!415848) tp_is_empty!10713 (not b!415850) (not b!415840) (not b!415844))
(check-sat b_and!16999 (not b_next!9561))
