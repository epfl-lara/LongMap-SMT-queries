; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39336 () Bool)

(assert start!39336)

(declare-fun b_free!9603 () Bool)

(declare-fun b_next!9603 () Bool)

(assert (=> start!39336 (= b_free!9603 (not b_next!9603))))

(declare-fun tp!34337 () Bool)

(declare-fun b_and!17081 () Bool)

(assert (=> start!39336 (= tp!34337 b_and!17081)))

(declare-fun b!417076 () Bool)

(declare-fun res!242853 () Bool)

(declare-fun e!248893 () Bool)

(assert (=> b!417076 (=> (not res!242853) (not e!248893))))

(declare-datatypes ((array!25363 0))(
  ( (array!25364 (arr!12131 (Array (_ BitVec 32) (_ BitVec 64))) (size!12483 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25363)

(declare-datatypes ((List!7094 0))(
  ( (Nil!7091) (Cons!7090 (h!7946 (_ BitVec 64)) (t!12362 List!7094)) )
))
(declare-fun arrayNoDuplicates!0 (array!25363 (_ BitVec 32) List!7094) Bool)

(assert (=> b!417076 (= res!242853 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7091))))

(declare-fun mapIsEmpty!17754 () Bool)

(declare-fun mapRes!17754 () Bool)

(assert (=> mapIsEmpty!17754 mapRes!17754))

(declare-fun b!417077 () Bool)

(declare-fun e!248894 () Bool)

(assert (=> b!417077 (= e!248894 true)))

(declare-datatypes ((V!15445 0))(
  ( (V!15446 (val!5422 Int)) )
))
(declare-datatypes ((tuple2!7076 0))(
  ( (tuple2!7077 (_1!3549 (_ BitVec 64)) (_2!3549 V!15445)) )
))
(declare-fun lt!191024 () tuple2!7076)

(declare-datatypes ((List!7095 0))(
  ( (Nil!7092) (Cons!7091 (h!7947 tuple2!7076) (t!12363 List!7095)) )
))
(declare-datatypes ((ListLongMap!5989 0))(
  ( (ListLongMap!5990 (toList!3010 List!7095)) )
))
(declare-fun lt!191031 () ListLongMap!5989)

(declare-fun lt!191033 () V!15445)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1212 (ListLongMap!5989 tuple2!7076) ListLongMap!5989)

(assert (=> b!417077 (= (+!1212 lt!191031 lt!191024) (+!1212 (+!1212 lt!191031 (tuple2!7077 k0!794 lt!191033)) lt!191024))))

(declare-fun lt!191032 () V!15445)

(assert (=> b!417077 (= lt!191024 (tuple2!7077 k0!794 lt!191032))))

(declare-datatypes ((Unit!12326 0))(
  ( (Unit!12327) )
))
(declare-fun lt!191023 () Unit!12326)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!15 (ListLongMap!5989 (_ BitVec 64) V!15445 V!15445) Unit!12326)

(assert (=> b!417077 (= lt!191023 (addSameAsAddTwiceSameKeyDiffValues!15 lt!191031 k0!794 lt!191033 lt!191032))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5034 0))(
  ( (ValueCellFull!5034 (v!7669 V!15445)) (EmptyCell!5034) )
))
(declare-datatypes ((array!25365 0))(
  ( (array!25366 (arr!12132 (Array (_ BitVec 32) ValueCell!5034)) (size!12484 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25365)

(declare-fun lt!191026 () V!15445)

(declare-fun get!6001 (ValueCell!5034 V!15445) V!15445)

(assert (=> b!417077 (= lt!191033 (get!6001 (select (arr!12132 _values!549) from!863) lt!191026))))

(declare-fun lt!191029 () ListLongMap!5989)

(declare-fun lt!191028 () array!25363)

(assert (=> b!417077 (= lt!191029 (+!1212 lt!191031 (tuple2!7077 (select (arr!12131 lt!191028) from!863) lt!191032)))))

(declare-fun v!412 () V!15445)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417077 (= lt!191032 (get!6001 (select (store (arr!12132 _values!549) i!563 (ValueCellFull!5034 v!412)) from!863) lt!191026))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!686 (Int (_ BitVec 64)) V!15445)

(assert (=> b!417077 (= lt!191026 (dynLambda!686 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15445)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15445)

(declare-fun lt!191030 () array!25365)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1215 (array!25363 array!25365 (_ BitVec 32) (_ BitVec 32) V!15445 V!15445 (_ BitVec 32) Int) ListLongMap!5989)

(assert (=> b!417077 (= lt!191031 (getCurrentListMapNoExtraKeys!1215 lt!191028 lt!191030 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417078 () Bool)

(declare-fun e!248898 () Bool)

(assert (=> b!417078 (= e!248893 e!248898)))

(declare-fun res!242850 () Bool)

(assert (=> b!417078 (=> (not res!242850) (not e!248898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25363 (_ BitVec 32)) Bool)

(assert (=> b!417078 (= res!242850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191028 mask!1025))))

(assert (=> b!417078 (= lt!191028 (array!25364 (store (arr!12131 _keys!709) i!563 k0!794) (size!12483 _keys!709)))))

(declare-fun b!417080 () Bool)

(declare-fun e!248891 () Bool)

(declare-fun call!28988 () ListLongMap!5989)

(declare-fun call!28987 () ListLongMap!5989)

(assert (=> b!417080 (= e!248891 (= call!28988 call!28987))))

(declare-fun b!417081 () Bool)

(declare-fun e!248895 () Bool)

(declare-fun tp_is_empty!10755 () Bool)

(assert (=> b!417081 (= e!248895 tp_is_empty!10755)))

(declare-fun b!417082 () Bool)

(declare-fun res!242854 () Bool)

(assert (=> b!417082 (=> (not res!242854) (not e!248893))))

(assert (=> b!417082 (= res!242854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417083 () Bool)

(declare-fun res!242855 () Bool)

(assert (=> b!417083 (=> (not res!242855) (not e!248893))))

(assert (=> b!417083 (= res!242855 (and (= (size!12484 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12483 _keys!709) (size!12484 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417084 () Bool)

(declare-fun res!242858 () Bool)

(assert (=> b!417084 (=> (not res!242858) (not e!248893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417084 (= res!242858 (validKeyInArray!0 k0!794))))

(declare-fun b!417085 () Bool)

(declare-fun e!248897 () Bool)

(assert (=> b!417085 (= e!248898 e!248897)))

(declare-fun res!242849 () Bool)

(assert (=> b!417085 (=> (not res!242849) (not e!248897))))

(assert (=> b!417085 (= res!242849 (= from!863 i!563))))

(assert (=> b!417085 (= lt!191029 (getCurrentListMapNoExtraKeys!1215 lt!191028 lt!191030 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417085 (= lt!191030 (array!25366 (store (arr!12132 _values!549) i!563 (ValueCellFull!5034 v!412)) (size!12484 _values!549)))))

(declare-fun lt!191025 () ListLongMap!5989)

(assert (=> b!417085 (= lt!191025 (getCurrentListMapNoExtraKeys!1215 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417086 () Bool)

(assert (=> b!417086 (= e!248897 (not e!248894))))

(declare-fun res!242846 () Bool)

(assert (=> b!417086 (=> res!242846 e!248894)))

(assert (=> b!417086 (= res!242846 (validKeyInArray!0 (select (arr!12131 _keys!709) from!863)))))

(assert (=> b!417086 e!248891))

(declare-fun c!55118 () Bool)

(assert (=> b!417086 (= c!55118 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191027 () Unit!12326)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!419 (array!25363 array!25365 (_ BitVec 32) (_ BitVec 32) V!15445 V!15445 (_ BitVec 32) (_ BitVec 64) V!15445 (_ BitVec 32) Int) Unit!12326)

(assert (=> b!417086 (= lt!191027 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!419 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417087 () Bool)

(declare-fun res!242848 () Bool)

(assert (=> b!417087 (=> (not res!242848) (not e!248898))))

(assert (=> b!417087 (= res!242848 (arrayNoDuplicates!0 lt!191028 #b00000000000000000000000000000000 Nil!7091))))

(declare-fun mapNonEmpty!17754 () Bool)

(declare-fun tp!34338 () Bool)

(declare-fun e!248890 () Bool)

(assert (=> mapNonEmpty!17754 (= mapRes!17754 (and tp!34338 e!248890))))

(declare-fun mapValue!17754 () ValueCell!5034)

(declare-fun mapKey!17754 () (_ BitVec 32))

(declare-fun mapRest!17754 () (Array (_ BitVec 32) ValueCell!5034))

(assert (=> mapNonEmpty!17754 (= (arr!12132 _values!549) (store mapRest!17754 mapKey!17754 mapValue!17754))))

(declare-fun bm!28984 () Bool)

(assert (=> bm!28984 (= call!28987 (getCurrentListMapNoExtraKeys!1215 (ite c!55118 lt!191028 _keys!709) (ite c!55118 lt!191030 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417088 () Bool)

(declare-fun res!242852 () Bool)

(assert (=> b!417088 (=> (not res!242852) (not e!248893))))

(assert (=> b!417088 (= res!242852 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12483 _keys!709))))))

(declare-fun b!417089 () Bool)

(declare-fun res!242856 () Bool)

(assert (=> b!417089 (=> (not res!242856) (not e!248898))))

(assert (=> b!417089 (= res!242856 (bvsle from!863 i!563))))

(declare-fun b!417090 () Bool)

(declare-fun e!248896 () Bool)

(assert (=> b!417090 (= e!248896 (and e!248895 mapRes!17754))))

(declare-fun condMapEmpty!17754 () Bool)

(declare-fun mapDefault!17754 () ValueCell!5034)

(assert (=> b!417090 (= condMapEmpty!17754 (= (arr!12132 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5034)) mapDefault!17754)))))

(declare-fun b!417091 () Bool)

(assert (=> b!417091 (= e!248891 (= call!28987 (+!1212 call!28988 (tuple2!7077 k0!794 v!412))))))

(declare-fun b!417092 () Bool)

(declare-fun res!242857 () Bool)

(assert (=> b!417092 (=> (not res!242857) (not e!248893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417092 (= res!242857 (validMask!0 mask!1025))))

(declare-fun bm!28985 () Bool)

(assert (=> bm!28985 (= call!28988 (getCurrentListMapNoExtraKeys!1215 (ite c!55118 _keys!709 lt!191028) (ite c!55118 _values!549 lt!191030) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!242847 () Bool)

(assert (=> start!39336 (=> (not res!242847) (not e!248893))))

(assert (=> start!39336 (= res!242847 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12483 _keys!709))))))

(assert (=> start!39336 e!248893))

(assert (=> start!39336 tp_is_empty!10755))

(assert (=> start!39336 tp!34337))

(assert (=> start!39336 true))

(declare-fun array_inv!8846 (array!25365) Bool)

(assert (=> start!39336 (and (array_inv!8846 _values!549) e!248896)))

(declare-fun array_inv!8847 (array!25363) Bool)

(assert (=> start!39336 (array_inv!8847 _keys!709)))

(declare-fun b!417079 () Bool)

(assert (=> b!417079 (= e!248890 tp_is_empty!10755)))

(declare-fun b!417093 () Bool)

(declare-fun res!242859 () Bool)

(assert (=> b!417093 (=> (not res!242859) (not e!248893))))

(declare-fun arrayContainsKey!0 (array!25363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417093 (= res!242859 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417094 () Bool)

(declare-fun res!242851 () Bool)

(assert (=> b!417094 (=> (not res!242851) (not e!248893))))

(assert (=> b!417094 (= res!242851 (or (= (select (arr!12131 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12131 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39336 res!242847) b!417092))

(assert (= (and b!417092 res!242857) b!417083))

(assert (= (and b!417083 res!242855) b!417082))

(assert (= (and b!417082 res!242854) b!417076))

(assert (= (and b!417076 res!242853) b!417088))

(assert (= (and b!417088 res!242852) b!417084))

(assert (= (and b!417084 res!242858) b!417094))

(assert (= (and b!417094 res!242851) b!417093))

(assert (= (and b!417093 res!242859) b!417078))

(assert (= (and b!417078 res!242850) b!417087))

(assert (= (and b!417087 res!242848) b!417089))

(assert (= (and b!417089 res!242856) b!417085))

(assert (= (and b!417085 res!242849) b!417086))

(assert (= (and b!417086 c!55118) b!417091))

(assert (= (and b!417086 (not c!55118)) b!417080))

(assert (= (or b!417091 b!417080) bm!28984))

(assert (= (or b!417091 b!417080) bm!28985))

(assert (= (and b!417086 (not res!242846)) b!417077))

(assert (= (and b!417090 condMapEmpty!17754) mapIsEmpty!17754))

(assert (= (and b!417090 (not condMapEmpty!17754)) mapNonEmpty!17754))

(get-info :version)

(assert (= (and mapNonEmpty!17754 ((_ is ValueCellFull!5034) mapValue!17754)) b!417079))

(assert (= (and b!417090 ((_ is ValueCellFull!5034) mapDefault!17754)) b!417081))

(assert (= start!39336 b!417090))

(declare-fun b_lambda!8907 () Bool)

(assert (=> (not b_lambda!8907) (not b!417077)))

(declare-fun t!12361 () Bool)

(declare-fun tb!3225 () Bool)

(assert (=> (and start!39336 (= defaultEntry!557 defaultEntry!557) t!12361) tb!3225))

(declare-fun result!5977 () Bool)

(assert (=> tb!3225 (= result!5977 tp_is_empty!10755)))

(assert (=> b!417077 t!12361))

(declare-fun b_and!17083 () Bool)

(assert (= b_and!17081 (and (=> t!12361 result!5977) b_and!17083)))

(declare-fun m!406301 () Bool)

(assert (=> b!417093 m!406301))

(declare-fun m!406303 () Bool)

(assert (=> b!417077 m!406303))

(declare-fun m!406305 () Bool)

(assert (=> b!417077 m!406305))

(declare-fun m!406307 () Bool)

(assert (=> b!417077 m!406307))

(declare-fun m!406309 () Bool)

(assert (=> b!417077 m!406309))

(declare-fun m!406311 () Bool)

(assert (=> b!417077 m!406311))

(declare-fun m!406313 () Bool)

(assert (=> b!417077 m!406313))

(declare-fun m!406315 () Bool)

(assert (=> b!417077 m!406315))

(declare-fun m!406317 () Bool)

(assert (=> b!417077 m!406317))

(declare-fun m!406319 () Bool)

(assert (=> b!417077 m!406319))

(declare-fun m!406321 () Bool)

(assert (=> b!417077 m!406321))

(assert (=> b!417077 m!406319))

(declare-fun m!406323 () Bool)

(assert (=> b!417077 m!406323))

(assert (=> b!417077 m!406307))

(declare-fun m!406325 () Bool)

(assert (=> b!417077 m!406325))

(declare-fun m!406327 () Bool)

(assert (=> b!417077 m!406327))

(assert (=> b!417077 m!406311))

(declare-fun m!406329 () Bool)

(assert (=> bm!28984 m!406329))

(declare-fun m!406331 () Bool)

(assert (=> b!417091 m!406331))

(declare-fun m!406333 () Bool)

(assert (=> b!417094 m!406333))

(declare-fun m!406335 () Bool)

(assert (=> b!417092 m!406335))

(declare-fun m!406337 () Bool)

(assert (=> b!417087 m!406337))

(declare-fun m!406339 () Bool)

(assert (=> mapNonEmpty!17754 m!406339))

(declare-fun m!406341 () Bool)

(assert (=> bm!28985 m!406341))

(declare-fun m!406343 () Bool)

(assert (=> b!417076 m!406343))

(declare-fun m!406345 () Bool)

(assert (=> b!417085 m!406345))

(assert (=> b!417085 m!406317))

(declare-fun m!406347 () Bool)

(assert (=> b!417085 m!406347))

(declare-fun m!406349 () Bool)

(assert (=> b!417078 m!406349))

(declare-fun m!406351 () Bool)

(assert (=> b!417078 m!406351))

(declare-fun m!406353 () Bool)

(assert (=> b!417084 m!406353))

(declare-fun m!406355 () Bool)

(assert (=> start!39336 m!406355))

(declare-fun m!406357 () Bool)

(assert (=> start!39336 m!406357))

(declare-fun m!406359 () Bool)

(assert (=> b!417086 m!406359))

(assert (=> b!417086 m!406359))

(declare-fun m!406361 () Bool)

(assert (=> b!417086 m!406361))

(declare-fun m!406363 () Bool)

(assert (=> b!417086 m!406363))

(declare-fun m!406365 () Bool)

(assert (=> b!417082 m!406365))

(check-sat (not b_next!9603) b_and!17083 (not b!417076) (not start!39336) (not bm!28985) tp_is_empty!10755 (not bm!28984) (not b!417093) (not b!417078) (not b!417082) (not b!417085) (not b!417086) (not b!417092) (not b_lambda!8907) (not b!417091) (not mapNonEmpty!17754) (not b!417087) (not b!417077) (not b!417084))
(check-sat b_and!17083 (not b_next!9603))
