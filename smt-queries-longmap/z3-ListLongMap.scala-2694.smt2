; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39984 () Bool)

(assert start!39984)

(declare-fun b_free!10251 () Bool)

(declare-fun b_next!10251 () Bool)

(assert (=> start!39984 (= b_free!10251 (not b_next!10251))))

(declare-fun tp!36282 () Bool)

(declare-fun b_and!18161 () Bool)

(assert (=> start!39984 (= tp!36282 b_and!18161)))

(declare-fun b!434982 () Bool)

(declare-datatypes ((Unit!12907 0))(
  ( (Unit!12908) )
))
(declare-fun e!257025 () Unit!12907)

(declare-fun Unit!12909 () Unit!12907)

(assert (=> b!434982 (= e!257025 Unit!12909)))

(declare-fun res!256224 () Bool)

(declare-fun e!257023 () Bool)

(assert (=> start!39984 (=> (not res!256224) (not e!257023))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26637 0))(
  ( (array!26638 (arr!12768 (Array (_ BitVec 32) (_ BitVec 64))) (size!13120 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26637)

(assert (=> start!39984 (= res!256224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13120 _keys!709))))))

(assert (=> start!39984 e!257023))

(declare-fun tp_is_empty!11403 () Bool)

(assert (=> start!39984 tp_is_empty!11403))

(assert (=> start!39984 tp!36282))

(assert (=> start!39984 true))

(declare-datatypes ((V!16309 0))(
  ( (V!16310 (val!5746 Int)) )
))
(declare-datatypes ((ValueCell!5358 0))(
  ( (ValueCellFull!5358 (v!7993 V!16309)) (EmptyCell!5358) )
))
(declare-datatypes ((array!26639 0))(
  ( (array!26640 (arr!12769 (Array (_ BitVec 32) ValueCell!5358)) (size!13121 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26639)

(declare-fun e!257028 () Bool)

(declare-fun array_inv!9282 (array!26639) Bool)

(assert (=> start!39984 (and (array_inv!9282 _values!549) e!257028)))

(declare-fun array_inv!9283 (array!26637) Bool)

(assert (=> start!39984 (array_inv!9283 _keys!709)))

(declare-fun b!434983 () Bool)

(declare-fun res!256216 () Bool)

(assert (=> b!434983 (=> (not res!256216) (not e!257023))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434983 (= res!256216 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13120 _keys!709))))))

(declare-fun b!434984 () Bool)

(declare-fun Unit!12910 () Unit!12907)

(assert (=> b!434984 (= e!257025 Unit!12910)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!200152 () Unit!12907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12907)

(assert (=> b!434984 (= lt!200152 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434984 false))

(declare-fun b!434985 () Bool)

(declare-fun res!256218 () Bool)

(assert (=> b!434985 (=> (not res!256218) (not e!257023))))

(assert (=> b!434985 (= res!256218 (or (= (select (arr!12768 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12768 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18726 () Bool)

(declare-fun mapRes!18726 () Bool)

(assert (=> mapIsEmpty!18726 mapRes!18726))

(declare-fun b!434986 () Bool)

(declare-fun res!256223 () Bool)

(assert (=> b!434986 (=> (not res!256223) (not e!257023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434986 (= res!256223 (validKeyInArray!0 k0!794))))

(declare-fun b!434987 () Bool)

(declare-fun res!256221 () Bool)

(assert (=> b!434987 (=> (not res!256221) (not e!257023))))

(declare-datatypes ((List!7609 0))(
  ( (Nil!7606) (Cons!7605 (h!8461 (_ BitVec 64)) (t!13309 List!7609)) )
))
(declare-fun arrayNoDuplicates!0 (array!26637 (_ BitVec 32) List!7609) Bool)

(assert (=> b!434987 (= res!256221 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7606))))

(declare-fun b!434988 () Bool)

(declare-fun res!256227 () Bool)

(assert (=> b!434988 (=> (not res!256227) (not e!257023))))

(declare-fun arrayContainsKey!0 (array!26637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434988 (= res!256227 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434989 () Bool)

(declare-fun e!257027 () Bool)

(assert (=> b!434989 (= e!257028 (and e!257027 mapRes!18726))))

(declare-fun condMapEmpty!18726 () Bool)

(declare-fun mapDefault!18726 () ValueCell!5358)

(assert (=> b!434989 (= condMapEmpty!18726 (= (arr!12769 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5358)) mapDefault!18726)))))

(declare-fun b!434990 () Bool)

(declare-fun e!257029 () Bool)

(declare-fun e!257024 () Bool)

(assert (=> b!434990 (= e!257029 (not e!257024))))

(declare-fun res!256229 () Bool)

(assert (=> b!434990 (=> res!256229 e!257024)))

(assert (=> b!434990 (= res!256229 (not (validKeyInArray!0 (select (arr!12768 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7606 0))(
  ( (tuple2!7607 (_1!3814 (_ BitVec 64)) (_2!3814 V!16309)) )
))
(declare-datatypes ((List!7610 0))(
  ( (Nil!7607) (Cons!7606 (h!8462 tuple2!7606) (t!13310 List!7610)) )
))
(declare-datatypes ((ListLongMap!6519 0))(
  ( (ListLongMap!6520 (toList!3275 List!7610)) )
))
(declare-fun lt!200161 () ListLongMap!6519)

(declare-fun lt!200160 () ListLongMap!6519)

(assert (=> b!434990 (= lt!200161 lt!200160)))

(declare-fun lt!200156 () ListLongMap!6519)

(declare-fun lt!200154 () tuple2!7606)

(declare-fun +!1423 (ListLongMap!6519 tuple2!7606) ListLongMap!6519)

(assert (=> b!434990 (= lt!200160 (+!1423 lt!200156 lt!200154))))

(declare-fun minValue!515 () V!16309)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16309)

(declare-fun lt!200155 () array!26637)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!200159 () array!26639)

(declare-fun getCurrentListMapNoExtraKeys!1466 (array!26637 array!26639 (_ BitVec 32) (_ BitVec 32) V!16309 V!16309 (_ BitVec 32) Int) ListLongMap!6519)

(assert (=> b!434990 (= lt!200161 (getCurrentListMapNoExtraKeys!1466 lt!200155 lt!200159 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16309)

(assert (=> b!434990 (= lt!200154 (tuple2!7607 k0!794 v!412))))

(assert (=> b!434990 (= lt!200156 (getCurrentListMapNoExtraKeys!1466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200164 () Unit!12907)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 (array!26637 array!26639 (_ BitVec 32) (_ BitVec 32) V!16309 V!16309 (_ BitVec 32) (_ BitVec 64) V!16309 (_ BitVec 32) Int) Unit!12907)

(assert (=> b!434990 (= lt!200164 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434991 () Bool)

(declare-fun res!256220 () Bool)

(assert (=> b!434991 (=> (not res!256220) (not e!257023))))

(assert (=> b!434991 (= res!256220 (and (= (size!13121 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13120 _keys!709) (size!13121 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434992 () Bool)

(declare-fun res!256222 () Bool)

(declare-fun e!257030 () Bool)

(assert (=> b!434992 (=> (not res!256222) (not e!257030))))

(assert (=> b!434992 (= res!256222 (arrayNoDuplicates!0 lt!200155 #b00000000000000000000000000000000 Nil!7606))))

(declare-fun b!434993 () Bool)

(declare-fun res!256230 () Bool)

(assert (=> b!434993 (=> (not res!256230) (not e!257030))))

(assert (=> b!434993 (= res!256230 (bvsle from!863 i!563))))

(declare-fun b!434994 () Bool)

(declare-fun e!257031 () Bool)

(assert (=> b!434994 (= e!257031 tp_is_empty!11403)))

(declare-fun b!434995 () Bool)

(declare-fun res!256225 () Bool)

(assert (=> b!434995 (=> (not res!256225) (not e!257023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26637 (_ BitVec 32)) Bool)

(assert (=> b!434995 (= res!256225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434996 () Bool)

(declare-fun res!256219 () Bool)

(assert (=> b!434996 (=> (not res!256219) (not e!257023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434996 (= res!256219 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18726 () Bool)

(declare-fun tp!36281 () Bool)

(assert (=> mapNonEmpty!18726 (= mapRes!18726 (and tp!36281 e!257031))))

(declare-fun mapValue!18726 () ValueCell!5358)

(declare-fun mapKey!18726 () (_ BitVec 32))

(declare-fun mapRest!18726 () (Array (_ BitVec 32) ValueCell!5358))

(assert (=> mapNonEmpty!18726 (= (arr!12769 _values!549) (store mapRest!18726 mapKey!18726 mapValue!18726))))

(declare-fun b!434997 () Bool)

(declare-fun e!257026 () Bool)

(assert (=> b!434997 (= e!257026 true)))

(declare-fun lt!200157 () tuple2!7606)

(declare-fun lt!200165 () ListLongMap!6519)

(assert (=> b!434997 (= lt!200165 (+!1423 (+!1423 lt!200156 lt!200157) lt!200154))))

(declare-fun lt!200151 () Unit!12907)

(declare-fun lt!200158 () V!16309)

(declare-fun addCommutativeForDiffKeys!407 (ListLongMap!6519 (_ BitVec 64) V!16309 (_ BitVec 64) V!16309) Unit!12907)

(assert (=> b!434997 (= lt!200151 (addCommutativeForDiffKeys!407 lt!200156 k0!794 v!412 (select (arr!12768 _keys!709) from!863) lt!200158))))

(declare-fun b!434998 () Bool)

(assert (=> b!434998 (= e!257023 e!257030)))

(declare-fun res!256228 () Bool)

(assert (=> b!434998 (=> (not res!256228) (not e!257030))))

(assert (=> b!434998 (= res!256228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200155 mask!1025))))

(assert (=> b!434998 (= lt!200155 (array!26638 (store (arr!12768 _keys!709) i!563 k0!794) (size!13120 _keys!709)))))

(declare-fun b!434999 () Bool)

(assert (=> b!434999 (= e!257030 e!257029)))

(declare-fun res!256217 () Bool)

(assert (=> b!434999 (=> (not res!256217) (not e!257029))))

(assert (=> b!434999 (= res!256217 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200162 () ListLongMap!6519)

(assert (=> b!434999 (= lt!200162 (getCurrentListMapNoExtraKeys!1466 lt!200155 lt!200159 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434999 (= lt!200159 (array!26640 (store (arr!12769 _values!549) i!563 (ValueCellFull!5358 v!412)) (size!13121 _values!549)))))

(declare-fun lt!200153 () ListLongMap!6519)

(assert (=> b!434999 (= lt!200153 (getCurrentListMapNoExtraKeys!1466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435000 () Bool)

(assert (=> b!435000 (= e!257027 tp_is_empty!11403)))

(declare-fun b!435001 () Bool)

(assert (=> b!435001 (= e!257024 e!257026)))

(declare-fun res!256226 () Bool)

(assert (=> b!435001 (=> res!256226 e!257026)))

(assert (=> b!435001 (= res!256226 (= k0!794 (select (arr!12768 _keys!709) from!863)))))

(assert (=> b!435001 (not (= (select (arr!12768 _keys!709) from!863) k0!794))))

(declare-fun lt!200163 () Unit!12907)

(assert (=> b!435001 (= lt!200163 e!257025)))

(declare-fun c!55712 () Bool)

(assert (=> b!435001 (= c!55712 (= (select (arr!12768 _keys!709) from!863) k0!794))))

(assert (=> b!435001 (= lt!200162 lt!200165)))

(assert (=> b!435001 (= lt!200165 (+!1423 lt!200160 lt!200157))))

(assert (=> b!435001 (= lt!200157 (tuple2!7607 (select (arr!12768 _keys!709) from!863) lt!200158))))

(declare-fun get!6362 (ValueCell!5358 V!16309) V!16309)

(declare-fun dynLambda!831 (Int (_ BitVec 64)) V!16309)

(assert (=> b!435001 (= lt!200158 (get!6362 (select (arr!12769 _values!549) from!863) (dynLambda!831 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39984 res!256224) b!434996))

(assert (= (and b!434996 res!256219) b!434991))

(assert (= (and b!434991 res!256220) b!434995))

(assert (= (and b!434995 res!256225) b!434987))

(assert (= (and b!434987 res!256221) b!434983))

(assert (= (and b!434983 res!256216) b!434986))

(assert (= (and b!434986 res!256223) b!434985))

(assert (= (and b!434985 res!256218) b!434988))

(assert (= (and b!434988 res!256227) b!434998))

(assert (= (and b!434998 res!256228) b!434992))

(assert (= (and b!434992 res!256222) b!434993))

(assert (= (and b!434993 res!256230) b!434999))

(assert (= (and b!434999 res!256217) b!434990))

(assert (= (and b!434990 (not res!256229)) b!435001))

(assert (= (and b!435001 c!55712) b!434984))

(assert (= (and b!435001 (not c!55712)) b!434982))

(assert (= (and b!435001 (not res!256226)) b!434997))

(assert (= (and b!434989 condMapEmpty!18726) mapIsEmpty!18726))

(assert (= (and b!434989 (not condMapEmpty!18726)) mapNonEmpty!18726))

(get-info :version)

(assert (= (and mapNonEmpty!18726 ((_ is ValueCellFull!5358) mapValue!18726)) b!434994))

(assert (= (and b!434989 ((_ is ValueCellFull!5358) mapDefault!18726)) b!435000))

(assert (= start!39984 b!434989))

(declare-fun b_lambda!9339 () Bool)

(assert (=> (not b_lambda!9339) (not b!435001)))

(declare-fun t!13308 () Bool)

(declare-fun tb!3657 () Bool)

(assert (=> (and start!39984 (= defaultEntry!557 defaultEntry!557) t!13308) tb!3657))

(declare-fun result!6841 () Bool)

(assert (=> tb!3657 (= result!6841 tp_is_empty!11403)))

(assert (=> b!435001 t!13308))

(declare-fun b_and!18163 () Bool)

(assert (= b_and!18161 (and (=> t!13308 result!6841) b_and!18163)))

(declare-fun m!422899 () Bool)

(assert (=> b!434990 m!422899))

(declare-fun m!422901 () Bool)

(assert (=> b!434990 m!422901))

(declare-fun m!422903 () Bool)

(assert (=> b!434990 m!422903))

(declare-fun m!422905 () Bool)

(assert (=> b!434990 m!422905))

(assert (=> b!434990 m!422899))

(declare-fun m!422907 () Bool)

(assert (=> b!434990 m!422907))

(declare-fun m!422909 () Bool)

(assert (=> b!434990 m!422909))

(declare-fun m!422911 () Bool)

(assert (=> b!434997 m!422911))

(assert (=> b!434997 m!422911))

(declare-fun m!422913 () Bool)

(assert (=> b!434997 m!422913))

(assert (=> b!434997 m!422899))

(assert (=> b!434997 m!422899))

(declare-fun m!422915 () Bool)

(assert (=> b!434997 m!422915))

(declare-fun m!422917 () Bool)

(assert (=> b!434984 m!422917))

(declare-fun m!422919 () Bool)

(assert (=> b!434985 m!422919))

(declare-fun m!422921 () Bool)

(assert (=> b!434992 m!422921))

(declare-fun m!422923 () Bool)

(assert (=> b!434995 m!422923))

(declare-fun m!422925 () Bool)

(assert (=> mapNonEmpty!18726 m!422925))

(declare-fun m!422927 () Bool)

(assert (=> b!434999 m!422927))

(declare-fun m!422929 () Bool)

(assert (=> b!434999 m!422929))

(declare-fun m!422931 () Bool)

(assert (=> b!434999 m!422931))

(declare-fun m!422933 () Bool)

(assert (=> b!434986 m!422933))

(declare-fun m!422935 () Bool)

(assert (=> start!39984 m!422935))

(declare-fun m!422937 () Bool)

(assert (=> start!39984 m!422937))

(assert (=> b!435001 m!422899))

(declare-fun m!422939 () Bool)

(assert (=> b!435001 m!422939))

(assert (=> b!435001 m!422939))

(declare-fun m!422941 () Bool)

(assert (=> b!435001 m!422941))

(declare-fun m!422943 () Bool)

(assert (=> b!435001 m!422943))

(assert (=> b!435001 m!422941))

(declare-fun m!422945 () Bool)

(assert (=> b!435001 m!422945))

(declare-fun m!422947 () Bool)

(assert (=> b!434996 m!422947))

(declare-fun m!422949 () Bool)

(assert (=> b!434998 m!422949))

(declare-fun m!422951 () Bool)

(assert (=> b!434998 m!422951))

(declare-fun m!422953 () Bool)

(assert (=> b!434988 m!422953))

(declare-fun m!422955 () Bool)

(assert (=> b!434987 m!422955))

(check-sat (not b_next!10251) (not b!434990) (not b!434992) (not b!435001) (not start!39984) tp_is_empty!11403 (not b!434998) (not b!434986) b_and!18163 (not mapNonEmpty!18726) (not b!434997) (not b!434987) (not b!434984) (not b!434995) (not b_lambda!9339) (not b!434996) (not b!434999) (not b!434988))
(check-sat b_and!18163 (not b_next!10251))
