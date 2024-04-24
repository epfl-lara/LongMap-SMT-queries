; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39962 () Bool)

(assert start!39962)

(declare-fun b_free!10243 () Bool)

(declare-fun b_next!10243 () Bool)

(assert (=> start!39962 (= b_free!10243 (not b_next!10243))))

(declare-fun tp!36257 () Bool)

(declare-fun b_and!18159 () Bool)

(assert (=> start!39962 (= tp!36257 b_and!18159)))

(declare-fun b!434685 () Bool)

(declare-datatypes ((Unit!12892 0))(
  ( (Unit!12893) )
))
(declare-fun e!256872 () Unit!12892)

(declare-fun Unit!12894 () Unit!12892)

(assert (=> b!434685 (= e!256872 Unit!12894)))

(declare-fun b!434686 () Bool)

(declare-fun e!256871 () Bool)

(declare-fun e!256876 () Bool)

(assert (=> b!434686 (= e!256871 (not e!256876))))

(declare-fun res!256046 () Bool)

(assert (=> b!434686 (=> res!256046 e!256876)))

(declare-datatypes ((array!26626 0))(
  ( (array!26627 (arr!12762 (Array (_ BitVec 32) (_ BitVec 64))) (size!13114 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26626)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434686 (= res!256046 (not (validKeyInArray!0 (select (arr!12762 _keys!709) from!863))))))

(declare-datatypes ((V!16299 0))(
  ( (V!16300 (val!5742 Int)) )
))
(declare-datatypes ((tuple2!7502 0))(
  ( (tuple2!7503 (_1!3762 (_ BitVec 64)) (_2!3762 V!16299)) )
))
(declare-datatypes ((List!7493 0))(
  ( (Nil!7490) (Cons!7489 (h!8345 tuple2!7502) (t!13177 List!7493)) )
))
(declare-datatypes ((ListLongMap!6417 0))(
  ( (ListLongMap!6418 (toList!3224 List!7493)) )
))
(declare-fun lt!199992 () ListLongMap!6417)

(declare-fun lt!199996 () ListLongMap!6417)

(assert (=> b!434686 (= lt!199992 lt!199996)))

(declare-fun lt!200003 () ListLongMap!6417)

(declare-fun lt!200002 () tuple2!7502)

(declare-fun +!1428 (ListLongMap!6417 tuple2!7502) ListLongMap!6417)

(assert (=> b!434686 (= lt!199996 (+!1428 lt!200003 lt!200002))))

(declare-fun minValue!515 () V!16299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16299)

(declare-fun lt!199999 () array!26626)

(declare-datatypes ((ValueCell!5354 0))(
  ( (ValueCellFull!5354 (v!7990 V!16299)) (EmptyCell!5354) )
))
(declare-datatypes ((array!26628 0))(
  ( (array!26629 (arr!12763 (Array (_ BitVec 32) ValueCell!5354)) (size!13115 (_ BitVec 32))) )
))
(declare-fun lt!199998 () array!26628)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1460 (array!26626 array!26628 (_ BitVec 32) (_ BitVec 32) V!16299 V!16299 (_ BitVec 32) Int) ListLongMap!6417)

(assert (=> b!434686 (= lt!199992 (getCurrentListMapNoExtraKeys!1460 lt!199999 lt!199998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16299)

(assert (=> b!434686 (= lt!200002 (tuple2!7503 k0!794 v!412))))

(declare-fun _values!549 () array!26628)

(assert (=> b!434686 (= lt!200003 (getCurrentListMapNoExtraKeys!1460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!199993 () Unit!12892)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!593 (array!26626 array!26628 (_ BitVec 32) (_ BitVec 32) V!16299 V!16299 (_ BitVec 32) (_ BitVec 64) V!16299 (_ BitVec 32) Int) Unit!12892)

(assert (=> b!434686 (= lt!199993 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!593 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434687 () Bool)

(declare-fun Unit!12895 () Unit!12892)

(assert (=> b!434687 (= e!256872 Unit!12895)))

(declare-fun lt!200000 () Unit!12892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12892)

(assert (=> b!434687 (= lt!200000 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434687 false))

(declare-fun b!434688 () Bool)

(declare-fun res!256041 () Bool)

(declare-fun e!256873 () Bool)

(assert (=> b!434688 (=> (not res!256041) (not e!256873))))

(assert (=> b!434688 (= res!256041 (validKeyInArray!0 k0!794))))

(declare-fun b!434689 () Bool)

(declare-fun e!256879 () Bool)

(assert (=> b!434689 (= e!256879 true)))

(declare-fun lt!200001 () ListLongMap!6417)

(declare-fun lt!199995 () tuple2!7502)

(assert (=> b!434689 (= lt!200001 (+!1428 (+!1428 lt!200003 lt!199995) lt!200002))))

(declare-fun lt!199994 () V!16299)

(declare-fun lt!200004 () Unit!12892)

(declare-fun addCommutativeForDiffKeys!399 (ListLongMap!6417 (_ BitVec 64) V!16299 (_ BitVec 64) V!16299) Unit!12892)

(assert (=> b!434689 (= lt!200004 (addCommutativeForDiffKeys!399 lt!200003 k0!794 v!412 (select (arr!12762 _keys!709) from!863) lt!199994))))

(declare-fun mapNonEmpty!18714 () Bool)

(declare-fun mapRes!18714 () Bool)

(declare-fun tp!36258 () Bool)

(declare-fun e!256874 () Bool)

(assert (=> mapNonEmpty!18714 (= mapRes!18714 (and tp!36258 e!256874))))

(declare-fun mapValue!18714 () ValueCell!5354)

(declare-fun mapRest!18714 () (Array (_ BitVec 32) ValueCell!5354))

(declare-fun mapKey!18714 () (_ BitVec 32))

(assert (=> mapNonEmpty!18714 (= (arr!12763 _values!549) (store mapRest!18714 mapKey!18714 mapValue!18714))))

(declare-fun b!434690 () Bool)

(declare-fun res!256043 () Bool)

(declare-fun e!256877 () Bool)

(assert (=> b!434690 (=> (not res!256043) (not e!256877))))

(assert (=> b!434690 (= res!256043 (bvsle from!863 i!563))))

(declare-fun b!434691 () Bool)

(assert (=> b!434691 (= e!256873 e!256877)))

(declare-fun res!256047 () Bool)

(assert (=> b!434691 (=> (not res!256047) (not e!256877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26626 (_ BitVec 32)) Bool)

(assert (=> b!434691 (= res!256047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199999 mask!1025))))

(assert (=> b!434691 (= lt!199999 (array!26627 (store (arr!12762 _keys!709) i!563 k0!794) (size!13114 _keys!709)))))

(declare-fun b!434692 () Bool)

(declare-fun res!256034 () Bool)

(assert (=> b!434692 (=> (not res!256034) (not e!256873))))

(declare-fun arrayContainsKey!0 (array!26626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434692 (= res!256034 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434694 () Bool)

(assert (=> b!434694 (= e!256876 e!256879)))

(declare-fun res!256035 () Bool)

(assert (=> b!434694 (=> res!256035 e!256879)))

(assert (=> b!434694 (= res!256035 (= k0!794 (select (arr!12762 _keys!709) from!863)))))

(assert (=> b!434694 (not (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-fun lt!199990 () Unit!12892)

(assert (=> b!434694 (= lt!199990 e!256872)))

(declare-fun c!55677 () Bool)

(assert (=> b!434694 (= c!55677 (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-fun lt!199997 () ListLongMap!6417)

(assert (=> b!434694 (= lt!199997 lt!200001)))

(assert (=> b!434694 (= lt!200001 (+!1428 lt!199996 lt!199995))))

(assert (=> b!434694 (= lt!199995 (tuple2!7503 (select (arr!12762 _keys!709) from!863) lt!199994))))

(declare-fun get!6367 (ValueCell!5354 V!16299) V!16299)

(declare-fun dynLambda!832 (Int (_ BitVec 64)) V!16299)

(assert (=> b!434694 (= lt!199994 (get!6367 (select (arr!12763 _values!549) from!863) (dynLambda!832 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434695 () Bool)

(declare-fun res!256044 () Bool)

(assert (=> b!434695 (=> (not res!256044) (not e!256873))))

(assert (=> b!434695 (= res!256044 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13114 _keys!709))))))

(declare-fun b!434696 () Bool)

(declare-fun e!256878 () Bool)

(declare-fun e!256875 () Bool)

(assert (=> b!434696 (= e!256878 (and e!256875 mapRes!18714))))

(declare-fun condMapEmpty!18714 () Bool)

(declare-fun mapDefault!18714 () ValueCell!5354)

(assert (=> b!434696 (= condMapEmpty!18714 (= (arr!12763 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5354)) mapDefault!18714)))))

(declare-fun mapIsEmpty!18714 () Bool)

(assert (=> mapIsEmpty!18714 mapRes!18714))

(declare-fun b!434697 () Bool)

(declare-fun res!256040 () Bool)

(assert (=> b!434697 (=> (not res!256040) (not e!256877))))

(declare-datatypes ((List!7494 0))(
  ( (Nil!7491) (Cons!7490 (h!8346 (_ BitVec 64)) (t!13178 List!7494)) )
))
(declare-fun arrayNoDuplicates!0 (array!26626 (_ BitVec 32) List!7494) Bool)

(assert (=> b!434697 (= res!256040 (arrayNoDuplicates!0 lt!199999 #b00000000000000000000000000000000 Nil!7491))))

(declare-fun b!434698 () Bool)

(declare-fun res!256045 () Bool)

(assert (=> b!434698 (=> (not res!256045) (not e!256873))))

(assert (=> b!434698 (= res!256045 (or (= (select (arr!12762 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12762 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434699 () Bool)

(declare-fun res!256037 () Bool)

(assert (=> b!434699 (=> (not res!256037) (not e!256873))))

(assert (=> b!434699 (= res!256037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434700 () Bool)

(declare-fun tp_is_empty!11395 () Bool)

(assert (=> b!434700 (= e!256874 tp_is_empty!11395)))

(declare-fun b!434701 () Bool)

(declare-fun res!256033 () Bool)

(assert (=> b!434701 (=> (not res!256033) (not e!256873))))

(assert (=> b!434701 (= res!256033 (and (= (size!13115 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13114 _keys!709) (size!13115 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!256042 () Bool)

(assert (=> start!39962 (=> (not res!256042) (not e!256873))))

(assert (=> start!39962 (= res!256042 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13114 _keys!709))))))

(assert (=> start!39962 e!256873))

(assert (=> start!39962 tp_is_empty!11395))

(assert (=> start!39962 tp!36257))

(assert (=> start!39962 true))

(declare-fun array_inv!9338 (array!26628) Bool)

(assert (=> start!39962 (and (array_inv!9338 _values!549) e!256878)))

(declare-fun array_inv!9339 (array!26626) Bool)

(assert (=> start!39962 (array_inv!9339 _keys!709)))

(declare-fun b!434693 () Bool)

(declare-fun res!256039 () Bool)

(assert (=> b!434693 (=> (not res!256039) (not e!256873))))

(assert (=> b!434693 (= res!256039 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7491))))

(declare-fun b!434702 () Bool)

(assert (=> b!434702 (= e!256877 e!256871)))

(declare-fun res!256036 () Bool)

(assert (=> b!434702 (=> (not res!256036) (not e!256871))))

(assert (=> b!434702 (= res!256036 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434702 (= lt!199997 (getCurrentListMapNoExtraKeys!1460 lt!199999 lt!199998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434702 (= lt!199998 (array!26629 (store (arr!12763 _values!549) i!563 (ValueCellFull!5354 v!412)) (size!13115 _values!549)))))

(declare-fun lt!199991 () ListLongMap!6417)

(assert (=> b!434702 (= lt!199991 (getCurrentListMapNoExtraKeys!1460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434703 () Bool)

(declare-fun res!256038 () Bool)

(assert (=> b!434703 (=> (not res!256038) (not e!256873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434703 (= res!256038 (validMask!0 mask!1025))))

(declare-fun b!434704 () Bool)

(assert (=> b!434704 (= e!256875 tp_is_empty!11395)))

(assert (= (and start!39962 res!256042) b!434703))

(assert (= (and b!434703 res!256038) b!434701))

(assert (= (and b!434701 res!256033) b!434699))

(assert (= (and b!434699 res!256037) b!434693))

(assert (= (and b!434693 res!256039) b!434695))

(assert (= (and b!434695 res!256044) b!434688))

(assert (= (and b!434688 res!256041) b!434698))

(assert (= (and b!434698 res!256045) b!434692))

(assert (= (and b!434692 res!256034) b!434691))

(assert (= (and b!434691 res!256047) b!434697))

(assert (= (and b!434697 res!256040) b!434690))

(assert (= (and b!434690 res!256043) b!434702))

(assert (= (and b!434702 res!256036) b!434686))

(assert (= (and b!434686 (not res!256046)) b!434694))

(assert (= (and b!434694 c!55677) b!434687))

(assert (= (and b!434694 (not c!55677)) b!434685))

(assert (= (and b!434694 (not res!256035)) b!434689))

(assert (= (and b!434696 condMapEmpty!18714) mapIsEmpty!18714))

(assert (= (and b!434696 (not condMapEmpty!18714)) mapNonEmpty!18714))

(get-info :version)

(assert (= (and mapNonEmpty!18714 ((_ is ValueCellFull!5354) mapValue!18714)) b!434700))

(assert (= (and b!434696 ((_ is ValueCellFull!5354) mapDefault!18714)) b!434704))

(assert (= start!39962 b!434696))

(declare-fun b_lambda!9353 () Bool)

(assert (=> (not b_lambda!9353) (not b!434694)))

(declare-fun t!13176 () Bool)

(declare-fun tb!3641 () Bool)

(assert (=> (and start!39962 (= defaultEntry!557 defaultEntry!557) t!13176) tb!3641))

(declare-fun result!6817 () Bool)

(assert (=> tb!3641 (= result!6817 tp_is_empty!11395)))

(assert (=> b!434694 t!13176))

(declare-fun b_and!18161 () Bool)

(assert (= b_and!18159 (and (=> t!13176 result!6817) b_and!18161)))

(declare-fun m!422885 () Bool)

(assert (=> b!434693 m!422885))

(declare-fun m!422887 () Bool)

(assert (=> b!434694 m!422887))

(declare-fun m!422889 () Bool)

(assert (=> b!434694 m!422889))

(declare-fun m!422891 () Bool)

(assert (=> b!434694 m!422891))

(declare-fun m!422893 () Bool)

(assert (=> b!434694 m!422893))

(assert (=> b!434694 m!422891))

(assert (=> b!434694 m!422889))

(declare-fun m!422895 () Bool)

(assert (=> b!434694 m!422895))

(declare-fun m!422897 () Bool)

(assert (=> b!434703 m!422897))

(declare-fun m!422899 () Bool)

(assert (=> mapNonEmpty!18714 m!422899))

(declare-fun m!422901 () Bool)

(assert (=> b!434692 m!422901))

(declare-fun m!422903 () Bool)

(assert (=> b!434689 m!422903))

(assert (=> b!434689 m!422903))

(declare-fun m!422905 () Bool)

(assert (=> b!434689 m!422905))

(assert (=> b!434689 m!422887))

(assert (=> b!434689 m!422887))

(declare-fun m!422907 () Bool)

(assert (=> b!434689 m!422907))

(declare-fun m!422909 () Bool)

(assert (=> b!434697 m!422909))

(declare-fun m!422911 () Bool)

(assert (=> b!434699 m!422911))

(declare-fun m!422913 () Bool)

(assert (=> b!434687 m!422913))

(assert (=> b!434686 m!422887))

(declare-fun m!422915 () Bool)

(assert (=> b!434686 m!422915))

(declare-fun m!422917 () Bool)

(assert (=> b!434686 m!422917))

(declare-fun m!422919 () Bool)

(assert (=> b!434686 m!422919))

(assert (=> b!434686 m!422887))

(declare-fun m!422921 () Bool)

(assert (=> b!434686 m!422921))

(declare-fun m!422923 () Bool)

(assert (=> b!434686 m!422923))

(declare-fun m!422925 () Bool)

(assert (=> b!434698 m!422925))

(declare-fun m!422927 () Bool)

(assert (=> start!39962 m!422927))

(declare-fun m!422929 () Bool)

(assert (=> start!39962 m!422929))

(declare-fun m!422931 () Bool)

(assert (=> b!434691 m!422931))

(declare-fun m!422933 () Bool)

(assert (=> b!434691 m!422933))

(declare-fun m!422935 () Bool)

(assert (=> b!434688 m!422935))

(declare-fun m!422937 () Bool)

(assert (=> b!434702 m!422937))

(declare-fun m!422939 () Bool)

(assert (=> b!434702 m!422939))

(declare-fun m!422941 () Bool)

(assert (=> b!434702 m!422941))

(check-sat (not b!434702) (not b!434693) (not b_next!10243) (not b!434692) (not b!434697) (not b!434687) (not b!434688) (not b!434686) (not mapNonEmpty!18714) b_and!18161 (not b!434703) (not b!434699) (not start!39962) (not b!434694) tp_is_empty!11395 (not b!434689) (not b_lambda!9353) (not b!434691))
(check-sat b_and!18161 (not b_next!10243))
