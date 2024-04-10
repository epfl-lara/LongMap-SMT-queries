; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41132 () Bool)

(assert start!41132)

(declare-fun b_free!11001 () Bool)

(declare-fun b_next!11001 () Bool)

(assert (=> start!41132 (= b_free!11001 (not b_next!11001))))

(declare-fun tp!38839 () Bool)

(declare-fun b_and!19241 () Bool)

(assert (=> start!41132 (= tp!38839 b_and!19241)))

(declare-fun b!458874 () Bool)

(declare-fun e!267892 () Bool)

(assert (=> b!458874 (= e!267892 true)))

(assert (=> b!458874 false))

(declare-datatypes ((Unit!13326 0))(
  ( (Unit!13327) )
))
(declare-fun lt!207584 () Unit!13326)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!28479 0))(
  ( (array!28480 (arr!13680 (Array (_ BitVec 32) (_ BitVec 64))) (size!14032 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28479)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13326)

(assert (=> b!458874 (= lt!207584 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!20158 () Bool)

(declare-fun mapRes!20158 () Bool)

(declare-fun tp!38838 () Bool)

(declare-fun e!267889 () Bool)

(assert (=> mapNonEmpty!20158 (= mapRes!20158 (and tp!38838 e!267889))))

(declare-datatypes ((V!17557 0))(
  ( (V!17558 (val!6214 Int)) )
))
(declare-datatypes ((ValueCell!5826 0))(
  ( (ValueCellFull!5826 (v!8492 V!17557)) (EmptyCell!5826) )
))
(declare-fun mapValue!20158 () ValueCell!5826)

(declare-fun mapKey!20158 () (_ BitVec 32))

(declare-fun mapRest!20158 () (Array (_ BitVec 32) ValueCell!5826))

(declare-datatypes ((array!28481 0))(
  ( (array!28482 (arr!13681 (Array (_ BitVec 32) ValueCell!5826)) (size!14033 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28481)

(assert (=> mapNonEmpty!20158 (= (arr!13681 _values!549) (store mapRest!20158 mapKey!20158 mapValue!20158))))

(declare-fun b!458875 () Bool)

(declare-fun res!274160 () Bool)

(declare-fun e!267896 () Bool)

(assert (=> b!458875 (=> (not res!274160) (not e!267896))))

(declare-datatypes ((List!8261 0))(
  ( (Nil!8258) (Cons!8257 (h!9113 (_ BitVec 64)) (t!14141 List!8261)) )
))
(declare-fun arrayNoDuplicates!0 (array!28479 (_ BitVec 32) List!8261) Bool)

(assert (=> b!458875 (= res!274160 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8258))))

(declare-fun mapIsEmpty!20158 () Bool)

(assert (=> mapIsEmpty!20158 mapRes!20158))

(declare-fun b!458876 () Bool)

(declare-fun res!274165 () Bool)

(assert (=> b!458876 (=> (not res!274165) (not e!267896))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458876 (= res!274165 (or (= (select (arr!13680 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13680 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458877 () Bool)

(declare-fun res!274169 () Bool)

(assert (=> b!458877 (=> (not res!274169) (not e!267896))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458877 (= res!274169 (validMask!0 mask!1025))))

(declare-fun b!458878 () Bool)

(declare-fun res!274157 () Bool)

(assert (=> b!458878 (=> (not res!274157) (not e!267896))))

(declare-fun arrayContainsKey!0 (array!28479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458878 (= res!274157 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458879 () Bool)

(declare-fun e!267895 () Bool)

(declare-fun e!267894 () Bool)

(assert (=> b!458879 (= e!267895 (not e!267894))))

(declare-fun res!274162 () Bool)

(assert (=> b!458879 (=> res!274162 e!267894)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458879 (= res!274162 (not (validKeyInArray!0 (select (arr!13680 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8190 0))(
  ( (tuple2!8191 (_1!4106 (_ BitVec 64)) (_2!4106 V!17557)) )
))
(declare-datatypes ((List!8262 0))(
  ( (Nil!8259) (Cons!8258 (h!9114 tuple2!8190) (t!14142 List!8262)) )
))
(declare-datatypes ((ListLongMap!7103 0))(
  ( (ListLongMap!7104 (toList!3567 List!8262)) )
))
(declare-fun lt!207578 () ListLongMap!7103)

(declare-fun lt!207577 () ListLongMap!7103)

(assert (=> b!458879 (= lt!207578 lt!207577)))

(declare-fun lt!207582 () ListLongMap!7103)

(declare-fun v!412 () V!17557)

(declare-fun +!1603 (ListLongMap!7103 tuple2!8190) ListLongMap!7103)

(assert (=> b!458879 (= lt!207577 (+!1603 lt!207582 (tuple2!8191 k0!794 v!412)))))

(declare-fun minValue!515 () V!17557)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17557)

(declare-fun lt!207580 () array!28481)

(declare-fun lt!207583 () array!28479)

(declare-fun getCurrentListMapNoExtraKeys!1749 (array!28479 array!28481 (_ BitVec 32) (_ BitVec 32) V!17557 V!17557 (_ BitVec 32) Int) ListLongMap!7103)

(assert (=> b!458879 (= lt!207578 (getCurrentListMapNoExtraKeys!1749 lt!207583 lt!207580 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458879 (= lt!207582 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207581 () Unit!13326)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!762 (array!28479 array!28481 (_ BitVec 32) (_ BitVec 32) V!17557 V!17557 (_ BitVec 32) (_ BitVec 64) V!17557 (_ BitVec 32) Int) Unit!13326)

(assert (=> b!458879 (= lt!207581 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458880 () Bool)

(declare-fun e!267893 () Bool)

(assert (=> b!458880 (= e!267896 e!267893)))

(declare-fun res!274170 () Bool)

(assert (=> b!458880 (=> (not res!274170) (not e!267893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28479 (_ BitVec 32)) Bool)

(assert (=> b!458880 (= res!274170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207583 mask!1025))))

(assert (=> b!458880 (= lt!207583 (array!28480 (store (arr!13680 _keys!709) i!563 k0!794) (size!14032 _keys!709)))))

(declare-fun res!274168 () Bool)

(assert (=> start!41132 (=> (not res!274168) (not e!267896))))

(assert (=> start!41132 (= res!274168 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14032 _keys!709))))))

(assert (=> start!41132 e!267896))

(declare-fun tp_is_empty!12339 () Bool)

(assert (=> start!41132 tp_is_empty!12339))

(assert (=> start!41132 tp!38839))

(assert (=> start!41132 true))

(declare-fun e!267890 () Bool)

(declare-fun array_inv!9900 (array!28481) Bool)

(assert (=> start!41132 (and (array_inv!9900 _values!549) e!267890)))

(declare-fun array_inv!9901 (array!28479) Bool)

(assert (=> start!41132 (array_inv!9901 _keys!709)))

(declare-fun b!458881 () Bool)

(assert (=> b!458881 (= e!267889 tp_is_empty!12339)))

(declare-fun b!458882 () Bool)

(assert (=> b!458882 (= e!267894 e!267892)))

(declare-fun res!274166 () Bool)

(assert (=> b!458882 (=> res!274166 e!267892)))

(assert (=> b!458882 (= res!274166 (not (= (select (arr!13680 _keys!709) from!863) k0!794)))))

(declare-fun lt!207576 () ListLongMap!7103)

(declare-fun get!6744 (ValueCell!5826 V!17557) V!17557)

(declare-fun dynLambda!890 (Int (_ BitVec 64)) V!17557)

(assert (=> b!458882 (= lt!207576 (+!1603 lt!207577 (tuple2!8191 (select (arr!13680 _keys!709) from!863) (get!6744 (select (arr!13681 _values!549) from!863) (dynLambda!890 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458883 () Bool)

(declare-fun res!274158 () Bool)

(assert (=> b!458883 (=> (not res!274158) (not e!267896))))

(assert (=> b!458883 (= res!274158 (and (= (size!14033 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14032 _keys!709) (size!14033 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458884 () Bool)

(declare-fun res!274159 () Bool)

(assert (=> b!458884 (=> (not res!274159) (not e!267896))))

(assert (=> b!458884 (= res!274159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458885 () Bool)

(assert (=> b!458885 (= e!267893 e!267895)))

(declare-fun res!274164 () Bool)

(assert (=> b!458885 (=> (not res!274164) (not e!267895))))

(assert (=> b!458885 (= res!274164 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!458885 (= lt!207576 (getCurrentListMapNoExtraKeys!1749 lt!207583 lt!207580 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458885 (= lt!207580 (array!28482 (store (arr!13681 _values!549) i!563 (ValueCellFull!5826 v!412)) (size!14033 _values!549)))))

(declare-fun lt!207579 () ListLongMap!7103)

(assert (=> b!458885 (= lt!207579 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458886 () Bool)

(declare-fun res!274171 () Bool)

(assert (=> b!458886 (=> (not res!274171) (not e!267896))))

(assert (=> b!458886 (= res!274171 (validKeyInArray!0 k0!794))))

(declare-fun b!458887 () Bool)

(declare-fun res!274161 () Bool)

(assert (=> b!458887 (=> (not res!274161) (not e!267893))))

(assert (=> b!458887 (= res!274161 (arrayNoDuplicates!0 lt!207583 #b00000000000000000000000000000000 Nil!8258))))

(declare-fun b!458888 () Bool)

(declare-fun res!274167 () Bool)

(assert (=> b!458888 (=> (not res!274167) (not e!267893))))

(assert (=> b!458888 (= res!274167 (bvsle from!863 i!563))))

(declare-fun b!458889 () Bool)

(declare-fun e!267891 () Bool)

(assert (=> b!458889 (= e!267891 tp_is_empty!12339)))

(declare-fun b!458890 () Bool)

(assert (=> b!458890 (= e!267890 (and e!267891 mapRes!20158))))

(declare-fun condMapEmpty!20158 () Bool)

(declare-fun mapDefault!20158 () ValueCell!5826)

(assert (=> b!458890 (= condMapEmpty!20158 (= (arr!13681 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5826)) mapDefault!20158)))))

(declare-fun b!458891 () Bool)

(declare-fun res!274163 () Bool)

(assert (=> b!458891 (=> (not res!274163) (not e!267896))))

(assert (=> b!458891 (= res!274163 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14032 _keys!709))))))

(assert (= (and start!41132 res!274168) b!458877))

(assert (= (and b!458877 res!274169) b!458883))

(assert (= (and b!458883 res!274158) b!458884))

(assert (= (and b!458884 res!274159) b!458875))

(assert (= (and b!458875 res!274160) b!458891))

(assert (= (and b!458891 res!274163) b!458886))

(assert (= (and b!458886 res!274171) b!458876))

(assert (= (and b!458876 res!274165) b!458878))

(assert (= (and b!458878 res!274157) b!458880))

(assert (= (and b!458880 res!274170) b!458887))

(assert (= (and b!458887 res!274161) b!458888))

(assert (= (and b!458888 res!274167) b!458885))

(assert (= (and b!458885 res!274164) b!458879))

(assert (= (and b!458879 (not res!274162)) b!458882))

(assert (= (and b!458882 (not res!274166)) b!458874))

(assert (= (and b!458890 condMapEmpty!20158) mapIsEmpty!20158))

(assert (= (and b!458890 (not condMapEmpty!20158)) mapNonEmpty!20158))

(get-info :version)

(assert (= (and mapNonEmpty!20158 ((_ is ValueCellFull!5826) mapValue!20158)) b!458881))

(assert (= (and b!458890 ((_ is ValueCellFull!5826) mapDefault!20158)) b!458889))

(assert (= start!41132 b!458890))

(declare-fun b_lambda!9835 () Bool)

(assert (=> (not b_lambda!9835) (not b!458882)))

(declare-fun t!14140 () Bool)

(declare-fun tb!3837 () Bool)

(assert (=> (and start!41132 (= defaultEntry!557 defaultEntry!557) t!14140) tb!3837))

(declare-fun result!7219 () Bool)

(assert (=> tb!3837 (= result!7219 tp_is_empty!12339)))

(assert (=> b!458882 t!14140))

(declare-fun b_and!19243 () Bool)

(assert (= b_and!19241 (and (=> t!14140 result!7219) b_and!19243)))

(declare-fun m!442219 () Bool)

(assert (=> b!458880 m!442219))

(declare-fun m!442221 () Bool)

(assert (=> b!458880 m!442221))

(declare-fun m!442223 () Bool)

(assert (=> b!458878 m!442223))

(declare-fun m!442225 () Bool)

(assert (=> b!458875 m!442225))

(declare-fun m!442227 () Bool)

(assert (=> b!458882 m!442227))

(declare-fun m!442229 () Bool)

(assert (=> b!458882 m!442229))

(declare-fun m!442231 () Bool)

(assert (=> b!458882 m!442231))

(declare-fun m!442233 () Bool)

(assert (=> b!458882 m!442233))

(assert (=> b!458882 m!442233))

(assert (=> b!458882 m!442229))

(declare-fun m!442235 () Bool)

(assert (=> b!458882 m!442235))

(declare-fun m!442237 () Bool)

(assert (=> b!458884 m!442237))

(declare-fun m!442239 () Bool)

(assert (=> b!458885 m!442239))

(declare-fun m!442241 () Bool)

(assert (=> b!458885 m!442241))

(declare-fun m!442243 () Bool)

(assert (=> b!458885 m!442243))

(declare-fun m!442245 () Bool)

(assert (=> b!458874 m!442245))

(declare-fun m!442247 () Bool)

(assert (=> b!458886 m!442247))

(declare-fun m!442249 () Bool)

(assert (=> b!458877 m!442249))

(assert (=> b!458879 m!442227))

(declare-fun m!442251 () Bool)

(assert (=> b!458879 m!442251))

(declare-fun m!442253 () Bool)

(assert (=> b!458879 m!442253))

(declare-fun m!442255 () Bool)

(assert (=> b!458879 m!442255))

(assert (=> b!458879 m!442227))

(declare-fun m!442257 () Bool)

(assert (=> b!458879 m!442257))

(declare-fun m!442259 () Bool)

(assert (=> b!458879 m!442259))

(declare-fun m!442261 () Bool)

(assert (=> b!458876 m!442261))

(declare-fun m!442263 () Bool)

(assert (=> start!41132 m!442263))

(declare-fun m!442265 () Bool)

(assert (=> start!41132 m!442265))

(declare-fun m!442267 () Bool)

(assert (=> mapNonEmpty!20158 m!442267))

(declare-fun m!442269 () Bool)

(assert (=> b!458887 m!442269))

(check-sat (not b!458877) (not b!458878) (not b!458886) (not b!458887) (not b!458879) (not start!41132) (not b!458874) (not b_lambda!9835) (not b!458884) (not b!458875) (not mapNonEmpty!20158) tp_is_empty!12339 b_and!19243 (not b!458880) (not b_next!11001) (not b!458882) (not b!458885))
(check-sat b_and!19243 (not b_next!11001))
