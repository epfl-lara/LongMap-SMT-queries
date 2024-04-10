; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39384 () Bool)

(assert start!39384)

(declare-fun b_free!9651 () Bool)

(declare-fun b_next!9651 () Bool)

(assert (=> start!39384 (= b_free!9651 (not b_next!9651))))

(declare-fun tp!34481 () Bool)

(declare-fun b_and!17177 () Bool)

(assert (=> start!39384 (= tp!34481 b_and!17177)))

(declare-fun b!418492 () Bool)

(declare-fun res!243862 () Bool)

(declare-fun e!249546 () Bool)

(assert (=> b!418492 (=> (not res!243862) (not e!249546))))

(declare-datatypes ((array!25457 0))(
  ( (array!25458 (arr!12178 (Array (_ BitVec 32) (_ BitVec 64))) (size!12530 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25457)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25457 (_ BitVec 32)) Bool)

(assert (=> b!418492 (= res!243862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418493 () Bool)

(declare-fun e!249542 () Bool)

(declare-datatypes ((V!15509 0))(
  ( (V!15510 (val!5446 Int)) )
))
(declare-datatypes ((tuple2!7122 0))(
  ( (tuple2!7123 (_1!3572 (_ BitVec 64)) (_2!3572 V!15509)) )
))
(declare-datatypes ((List!7135 0))(
  ( (Nil!7132) (Cons!7131 (h!7987 tuple2!7122) (t!12451 List!7135)) )
))
(declare-datatypes ((ListLongMap!6035 0))(
  ( (ListLongMap!6036 (toList!3033 List!7135)) )
))
(declare-fun call!29131 () ListLongMap!6035)

(declare-fun call!29132 () ListLongMap!6035)

(assert (=> b!418493 (= e!249542 (= call!29131 call!29132))))

(declare-fun b!418494 () Bool)

(declare-fun e!249543 () Bool)

(declare-fun e!249544 () Bool)

(assert (=> b!418494 (= e!249543 (not e!249544))))

(declare-fun res!243863 () Bool)

(assert (=> b!418494 (=> res!243863 e!249544)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418494 (= res!243863 (validKeyInArray!0 (select (arr!12178 _keys!709) from!863)))))

(assert (=> b!418494 e!249542))

(declare-fun c!55190 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418494 (= c!55190 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15509)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5058 0))(
  ( (ValueCellFull!5058 (v!7693 V!15509)) (EmptyCell!5058) )
))
(declare-datatypes ((array!25459 0))(
  ( (array!25460 (arr!12179 (Array (_ BitVec 32) ValueCell!5058)) (size!12531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25459)

(declare-fun zeroValue!515 () V!15509)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12368 0))(
  ( (Unit!12369) )
))
(declare-fun lt!191816 () Unit!12368)

(declare-fun v!412 () V!15509)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 (array!25457 array!25459 (_ BitVec 32) (_ BitVec 32) V!15509 V!15509 (_ BitVec 32) (_ BitVec 64) V!15509 (_ BitVec 32) Int) Unit!12368)

(assert (=> b!418494 (= lt!191816 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418495 () Bool)

(declare-fun res!243856 () Bool)

(assert (=> b!418495 (=> (not res!243856) (not e!249546))))

(assert (=> b!418495 (= res!243856 (and (= (size!12531 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12530 _keys!709) (size!12531 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17826 () Bool)

(declare-fun mapRes!17826 () Bool)

(declare-fun tp!34482 () Bool)

(declare-fun e!249539 () Bool)

(assert (=> mapNonEmpty!17826 (= mapRes!17826 (and tp!34482 e!249539))))

(declare-fun mapRest!17826 () (Array (_ BitVec 32) ValueCell!5058))

(declare-fun mapValue!17826 () ValueCell!5058)

(declare-fun mapKey!17826 () (_ BitVec 32))

(assert (=> mapNonEmpty!17826 (= (arr!12179 _values!549) (store mapRest!17826 mapKey!17826 mapValue!17826))))

(declare-fun b!418496 () Bool)

(declare-fun res!243866 () Bool)

(assert (=> b!418496 (=> (not res!243866) (not e!249546))))

(assert (=> b!418496 (= res!243866 (validKeyInArray!0 k0!794))))

(declare-fun b!418497 () Bool)

(declare-fun res!243854 () Bool)

(declare-fun e!249538 () Bool)

(assert (=> b!418497 (=> (not res!243854) (not e!249538))))

(declare-fun lt!191815 () array!25457)

(declare-datatypes ((List!7136 0))(
  ( (Nil!7133) (Cons!7132 (h!7988 (_ BitVec 64)) (t!12452 List!7136)) )
))
(declare-fun arrayNoDuplicates!0 (array!25457 (_ BitVec 32) List!7136) Bool)

(assert (=> b!418497 (= res!243854 (arrayNoDuplicates!0 lt!191815 #b00000000000000000000000000000000 Nil!7133))))

(declare-fun bm!29128 () Bool)

(declare-fun lt!191818 () array!25459)

(declare-fun getCurrentListMapNoExtraKeys!1238 (array!25457 array!25459 (_ BitVec 32) (_ BitVec 32) V!15509 V!15509 (_ BitVec 32) Int) ListLongMap!6035)

(assert (=> bm!29128 (= call!29131 (getCurrentListMapNoExtraKeys!1238 (ite c!55190 _keys!709 lt!191815) (ite c!55190 _values!549 lt!191818) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418499 () Bool)

(declare-fun tp_is_empty!10803 () Bool)

(assert (=> b!418499 (= e!249539 tp_is_empty!10803)))

(declare-fun b!418500 () Bool)

(declare-fun e!249541 () Bool)

(assert (=> b!418500 (= e!249541 tp_is_empty!10803)))

(declare-fun bm!29129 () Bool)

(assert (=> bm!29129 (= call!29132 (getCurrentListMapNoExtraKeys!1238 (ite c!55190 lt!191815 _keys!709) (ite c!55190 lt!191818 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418501 () Bool)

(declare-fun e!249540 () Bool)

(assert (=> b!418501 (= e!249540 (and e!249541 mapRes!17826))))

(declare-fun condMapEmpty!17826 () Bool)

(declare-fun mapDefault!17826 () ValueCell!5058)

(assert (=> b!418501 (= condMapEmpty!17826 (= (arr!12179 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5058)) mapDefault!17826)))))

(declare-fun b!418502 () Bool)

(declare-fun res!243859 () Bool)

(assert (=> b!418502 (=> (not res!243859) (not e!249546))))

(assert (=> b!418502 (= res!243859 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7133))))

(declare-fun b!418503 () Bool)

(assert (=> b!418503 (= e!249538 e!249543)))

(declare-fun res!243865 () Bool)

(assert (=> b!418503 (=> (not res!243865) (not e!249543))))

(assert (=> b!418503 (= res!243865 (= from!863 i!563))))

(declare-fun lt!191825 () ListLongMap!6035)

(assert (=> b!418503 (= lt!191825 (getCurrentListMapNoExtraKeys!1238 lt!191815 lt!191818 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418503 (= lt!191818 (array!25460 (store (arr!12179 _values!549) i!563 (ValueCellFull!5058 v!412)) (size!12531 _values!549)))))

(declare-fun lt!191824 () ListLongMap!6035)

(assert (=> b!418503 (= lt!191824 (getCurrentListMapNoExtraKeys!1238 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418504 () Bool)

(assert (=> b!418504 (= e!249546 e!249538)))

(declare-fun res!243860 () Bool)

(assert (=> b!418504 (=> (not res!243860) (not e!249538))))

(assert (=> b!418504 (= res!243860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191815 mask!1025))))

(assert (=> b!418504 (= lt!191815 (array!25458 (store (arr!12178 _keys!709) i!563 k0!794) (size!12530 _keys!709)))))

(declare-fun res!243855 () Bool)

(assert (=> start!39384 (=> (not res!243855) (not e!249546))))

(assert (=> start!39384 (= res!243855 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12530 _keys!709))))))

(assert (=> start!39384 e!249546))

(assert (=> start!39384 tp_is_empty!10803))

(assert (=> start!39384 tp!34481))

(assert (=> start!39384 true))

(declare-fun array_inv!8878 (array!25459) Bool)

(assert (=> start!39384 (and (array_inv!8878 _values!549) e!249540)))

(declare-fun array_inv!8879 (array!25457) Bool)

(assert (=> start!39384 (array_inv!8879 _keys!709)))

(declare-fun b!418498 () Bool)

(declare-fun res!243867 () Bool)

(assert (=> b!418498 (=> (not res!243867) (not e!249546))))

(declare-fun arrayContainsKey!0 (array!25457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418498 (= res!243867 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17826 () Bool)

(assert (=> mapIsEmpty!17826 mapRes!17826))

(declare-fun b!418505 () Bool)

(declare-fun +!1232 (ListLongMap!6035 tuple2!7122) ListLongMap!6035)

(assert (=> b!418505 (= e!249542 (= call!29132 (+!1232 call!29131 (tuple2!7123 k0!794 v!412))))))

(declare-fun b!418506 () Bool)

(assert (=> b!418506 (= e!249544 true)))

(declare-fun lt!191817 () V!15509)

(declare-fun lt!191822 () tuple2!7122)

(declare-fun lt!191820 () ListLongMap!6035)

(assert (=> b!418506 (= (+!1232 lt!191820 lt!191822) (+!1232 (+!1232 lt!191820 (tuple2!7123 k0!794 lt!191817)) lt!191822))))

(declare-fun lt!191821 () V!15509)

(assert (=> b!418506 (= lt!191822 (tuple2!7123 k0!794 lt!191821))))

(declare-fun lt!191819 () Unit!12368)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!32 (ListLongMap!6035 (_ BitVec 64) V!15509 V!15509) Unit!12368)

(assert (=> b!418506 (= lt!191819 (addSameAsAddTwiceSameKeyDiffValues!32 lt!191820 k0!794 lt!191817 lt!191821))))

(declare-fun lt!191823 () V!15509)

(declare-fun get!6034 (ValueCell!5058 V!15509) V!15509)

(assert (=> b!418506 (= lt!191817 (get!6034 (select (arr!12179 _values!549) from!863) lt!191823))))

(assert (=> b!418506 (= lt!191825 (+!1232 lt!191820 (tuple2!7123 (select (arr!12178 lt!191815) from!863) lt!191821)))))

(assert (=> b!418506 (= lt!191821 (get!6034 (select (store (arr!12179 _values!549) i!563 (ValueCellFull!5058 v!412)) from!863) lt!191823))))

(declare-fun dynLambda!703 (Int (_ BitVec 64)) V!15509)

(assert (=> b!418506 (= lt!191823 (dynLambda!703 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418506 (= lt!191820 (getCurrentListMapNoExtraKeys!1238 lt!191815 lt!191818 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418507 () Bool)

(declare-fun res!243861 () Bool)

(assert (=> b!418507 (=> (not res!243861) (not e!249546))))

(assert (=> b!418507 (= res!243861 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12530 _keys!709))))))

(declare-fun b!418508 () Bool)

(declare-fun res!243857 () Bool)

(assert (=> b!418508 (=> (not res!243857) (not e!249546))))

(assert (=> b!418508 (= res!243857 (or (= (select (arr!12178 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12178 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418509 () Bool)

(declare-fun res!243864 () Bool)

(assert (=> b!418509 (=> (not res!243864) (not e!249546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418509 (= res!243864 (validMask!0 mask!1025))))

(declare-fun b!418510 () Bool)

(declare-fun res!243858 () Bool)

(assert (=> b!418510 (=> (not res!243858) (not e!249538))))

(assert (=> b!418510 (= res!243858 (bvsle from!863 i!563))))

(assert (= (and start!39384 res!243855) b!418509))

(assert (= (and b!418509 res!243864) b!418495))

(assert (= (and b!418495 res!243856) b!418492))

(assert (= (and b!418492 res!243862) b!418502))

(assert (= (and b!418502 res!243859) b!418507))

(assert (= (and b!418507 res!243861) b!418496))

(assert (= (and b!418496 res!243866) b!418508))

(assert (= (and b!418508 res!243857) b!418498))

(assert (= (and b!418498 res!243867) b!418504))

(assert (= (and b!418504 res!243860) b!418497))

(assert (= (and b!418497 res!243854) b!418510))

(assert (= (and b!418510 res!243858) b!418503))

(assert (= (and b!418503 res!243865) b!418494))

(assert (= (and b!418494 c!55190) b!418505))

(assert (= (and b!418494 (not c!55190)) b!418493))

(assert (= (or b!418505 b!418493) bm!29129))

(assert (= (or b!418505 b!418493) bm!29128))

(assert (= (and b!418494 (not res!243863)) b!418506))

(assert (= (and b!418501 condMapEmpty!17826) mapIsEmpty!17826))

(assert (= (and b!418501 (not condMapEmpty!17826)) mapNonEmpty!17826))

(get-info :version)

(assert (= (and mapNonEmpty!17826 ((_ is ValueCellFull!5058) mapValue!17826)) b!418499))

(assert (= (and b!418501 ((_ is ValueCellFull!5058) mapDefault!17826)) b!418500))

(assert (= start!39384 b!418501))

(declare-fun b_lambda!8955 () Bool)

(assert (=> (not b_lambda!8955) (not b!418506)))

(declare-fun t!12450 () Bool)

(declare-fun tb!3273 () Bool)

(assert (=> (and start!39384 (= defaultEntry!557 defaultEntry!557) t!12450) tb!3273))

(declare-fun result!6073 () Bool)

(assert (=> tb!3273 (= result!6073 tp_is_empty!10803)))

(assert (=> b!418506 t!12450))

(declare-fun b_and!17179 () Bool)

(assert (= b_and!17177 (and (=> t!12450 result!6073) b_and!17179)))

(declare-fun m!407885 () Bool)

(assert (=> b!418492 m!407885))

(declare-fun m!407887 () Bool)

(assert (=> b!418496 m!407887))

(declare-fun m!407889 () Bool)

(assert (=> mapNonEmpty!17826 m!407889))

(declare-fun m!407891 () Bool)

(assert (=> bm!29128 m!407891))

(declare-fun m!407893 () Bool)

(assert (=> start!39384 m!407893))

(declare-fun m!407895 () Bool)

(assert (=> start!39384 m!407895))

(declare-fun m!407897 () Bool)

(assert (=> b!418506 m!407897))

(declare-fun m!407899 () Bool)

(assert (=> b!418506 m!407899))

(declare-fun m!407901 () Bool)

(assert (=> b!418506 m!407901))

(declare-fun m!407903 () Bool)

(assert (=> b!418506 m!407903))

(declare-fun m!407905 () Bool)

(assert (=> b!418506 m!407905))

(assert (=> b!418506 m!407903))

(declare-fun m!407907 () Bool)

(assert (=> b!418506 m!407907))

(declare-fun m!407909 () Bool)

(assert (=> b!418506 m!407909))

(declare-fun m!407911 () Bool)

(assert (=> b!418506 m!407911))

(declare-fun m!407913 () Bool)

(assert (=> b!418506 m!407913))

(declare-fun m!407915 () Bool)

(assert (=> b!418506 m!407915))

(declare-fun m!407917 () Bool)

(assert (=> b!418506 m!407917))

(assert (=> b!418506 m!407907))

(declare-fun m!407919 () Bool)

(assert (=> b!418506 m!407919))

(declare-fun m!407921 () Bool)

(assert (=> b!418506 m!407921))

(assert (=> b!418506 m!407919))

(declare-fun m!407923 () Bool)

(assert (=> b!418497 m!407923))

(declare-fun m!407925 () Bool)

(assert (=> b!418502 m!407925))

(declare-fun m!407927 () Bool)

(assert (=> b!418498 m!407927))

(declare-fun m!407929 () Bool)

(assert (=> b!418504 m!407929))

(declare-fun m!407931 () Bool)

(assert (=> b!418504 m!407931))

(declare-fun m!407933 () Bool)

(assert (=> b!418494 m!407933))

(assert (=> b!418494 m!407933))

(declare-fun m!407935 () Bool)

(assert (=> b!418494 m!407935))

(declare-fun m!407937 () Bool)

(assert (=> b!418494 m!407937))

(declare-fun m!407939 () Bool)

(assert (=> b!418503 m!407939))

(assert (=> b!418503 m!407917))

(declare-fun m!407941 () Bool)

(assert (=> b!418503 m!407941))

(declare-fun m!407943 () Bool)

(assert (=> b!418505 m!407943))

(declare-fun m!407945 () Bool)

(assert (=> bm!29129 m!407945))

(declare-fun m!407947 () Bool)

(assert (=> b!418508 m!407947))

(declare-fun m!407949 () Bool)

(assert (=> b!418509 m!407949))

(check-sat (not bm!29129) tp_is_empty!10803 (not bm!29128) (not b!418509) (not b!418494) (not b!418496) (not b!418503) (not b!418505) (not b_next!9651) (not start!39384) (not b!418504) (not b_lambda!8955) (not b!418502) (not b!418506) b_and!17179 (not b!418498) (not mapNonEmpty!17826) (not b!418497) (not b!418492))
(check-sat b_and!17179 (not b_next!9651))
