; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39372 () Bool)

(assert start!39372)

(declare-fun b_free!9639 () Bool)

(declare-fun b_next!9639 () Bool)

(assert (=> start!39372 (= b_free!9639 (not b_next!9639))))

(declare-fun tp!34445 () Bool)

(declare-fun b_and!17153 () Bool)

(assert (=> start!39372 (= tp!34445 b_and!17153)))

(declare-fun b!418138 () Bool)

(declare-fun res!243608 () Bool)

(declare-fun e!249381 () Bool)

(assert (=> b!418138 (=> (not res!243608) (not e!249381))))

(declare-datatypes ((array!25433 0))(
  ( (array!25434 (arr!12166 (Array (_ BitVec 32) (_ BitVec 64))) (size!12518 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25433)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418138 (= res!243608 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418139 () Bool)

(declare-fun res!243609 () Bool)

(assert (=> b!418139 (=> (not res!243609) (not e!249381))))

(declare-datatypes ((List!7124 0))(
  ( (Nil!7121) (Cons!7120 (h!7976 (_ BitVec 64)) (t!12428 List!7124)) )
))
(declare-fun arrayNoDuplicates!0 (array!25433 (_ BitVec 32) List!7124) Bool)

(assert (=> b!418139 (= res!243609 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7121))))

(declare-fun b!418140 () Bool)

(declare-fun e!249383 () Bool)

(declare-fun tp_is_empty!10791 () Bool)

(assert (=> b!418140 (= e!249383 tp_is_empty!10791)))

(declare-fun b!418141 () Bool)

(declare-fun res!243607 () Bool)

(assert (=> b!418141 (=> (not res!243607) (not e!249381))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418141 (= res!243607 (or (= (select (arr!12166 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12166 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418143 () Bool)

(declare-fun e!249384 () Bool)

(assert (=> b!418143 (= e!249381 e!249384)))

(declare-fun res!243612 () Bool)

(assert (=> b!418143 (=> (not res!243612) (not e!249384))))

(declare-fun lt!191625 () array!25433)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25433 (_ BitVec 32)) Bool)

(assert (=> b!418143 (= res!243612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191625 mask!1025))))

(assert (=> b!418143 (= lt!191625 (array!25434 (store (arr!12166 _keys!709) i!563 k0!794) (size!12518 _keys!709)))))

(declare-fun mapIsEmpty!17808 () Bool)

(declare-fun mapRes!17808 () Bool)

(assert (=> mapIsEmpty!17808 mapRes!17808))

(declare-fun b!418144 () Bool)

(declare-fun res!243614 () Bool)

(assert (=> b!418144 (=> (not res!243614) (not e!249381))))

(assert (=> b!418144 (= res!243614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418145 () Bool)

(declare-fun res!243613 () Bool)

(assert (=> b!418145 (=> (not res!243613) (not e!249381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418145 (= res!243613 (validKeyInArray!0 k0!794))))

(declare-fun b!418142 () Bool)

(declare-fun e!249376 () Bool)

(assert (=> b!418142 (= e!249376 true)))

(declare-datatypes ((V!15493 0))(
  ( (V!15494 (val!5440 Int)) )
))
(declare-datatypes ((tuple2!7110 0))(
  ( (tuple2!7111 (_1!3566 (_ BitVec 64)) (_2!3566 V!15493)) )
))
(declare-fun lt!191622 () tuple2!7110)

(declare-fun lt!191619 () V!15493)

(declare-datatypes ((List!7125 0))(
  ( (Nil!7122) (Cons!7121 (h!7977 tuple2!7110) (t!12429 List!7125)) )
))
(declare-datatypes ((ListLongMap!6023 0))(
  ( (ListLongMap!6024 (toList!3027 List!7125)) )
))
(declare-fun lt!191627 () ListLongMap!6023)

(declare-fun +!1227 (ListLongMap!6023 tuple2!7110) ListLongMap!6023)

(assert (=> b!418142 (= (+!1227 lt!191627 lt!191622) (+!1227 (+!1227 lt!191627 (tuple2!7111 k0!794 lt!191619)) lt!191622))))

(declare-fun lt!191620 () V!15493)

(assert (=> b!418142 (= lt!191622 (tuple2!7111 k0!794 lt!191620))))

(declare-datatypes ((Unit!12358 0))(
  ( (Unit!12359) )
))
(declare-fun lt!191626 () Unit!12358)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!27 (ListLongMap!6023 (_ BitVec 64) V!15493 V!15493) Unit!12358)

(assert (=> b!418142 (= lt!191626 (addSameAsAddTwiceSameKeyDiffValues!27 lt!191627 k0!794 lt!191619 lt!191620))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!191617 () V!15493)

(declare-datatypes ((ValueCell!5052 0))(
  ( (ValueCellFull!5052 (v!7687 V!15493)) (EmptyCell!5052) )
))
(declare-datatypes ((array!25435 0))(
  ( (array!25436 (arr!12167 (Array (_ BitVec 32) ValueCell!5052)) (size!12519 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25435)

(declare-fun get!6025 (ValueCell!5052 V!15493) V!15493)

(assert (=> b!418142 (= lt!191619 (get!6025 (select (arr!12167 _values!549) from!863) lt!191617))))

(declare-fun lt!191624 () ListLongMap!6023)

(assert (=> b!418142 (= lt!191624 (+!1227 lt!191627 (tuple2!7111 (select (arr!12166 lt!191625) from!863) lt!191620)))))

(declare-fun v!412 () V!15493)

(assert (=> b!418142 (= lt!191620 (get!6025 (select (store (arr!12167 _values!549) i!563 (ValueCellFull!5052 v!412)) from!863) lt!191617))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!698 (Int (_ BitVec 64)) V!15493)

(assert (=> b!418142 (= lt!191617 (dynLambda!698 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15493)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15493)

(declare-fun lt!191621 () array!25435)

(declare-fun getCurrentListMapNoExtraKeys!1232 (array!25433 array!25435 (_ BitVec 32) (_ BitVec 32) V!15493 V!15493 (_ BitVec 32) Int) ListLongMap!6023)

(assert (=> b!418142 (= lt!191627 (getCurrentListMapNoExtraKeys!1232 lt!191625 lt!191621 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!243604 () Bool)

(assert (=> start!39372 (=> (not res!243604) (not e!249381))))

(assert (=> start!39372 (= res!243604 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12518 _keys!709))))))

(assert (=> start!39372 e!249381))

(assert (=> start!39372 tp_is_empty!10791))

(assert (=> start!39372 tp!34445))

(assert (=> start!39372 true))

(declare-fun e!249379 () Bool)

(declare-fun array_inv!8866 (array!25435) Bool)

(assert (=> start!39372 (and (array_inv!8866 _values!549) e!249379)))

(declare-fun array_inv!8867 (array!25433) Bool)

(assert (=> start!39372 (array_inv!8867 _keys!709)))

(declare-fun b!418146 () Bool)

(declare-fun res!243615 () Bool)

(assert (=> b!418146 (=> (not res!243615) (not e!249381))))

(assert (=> b!418146 (= res!243615 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12518 _keys!709))))))

(declare-fun b!418147 () Bool)

(declare-fun e!249380 () Bool)

(assert (=> b!418147 (= e!249380 tp_is_empty!10791)))

(declare-fun b!418148 () Bool)

(declare-fun res!243605 () Bool)

(assert (=> b!418148 (=> (not res!243605) (not e!249381))))

(assert (=> b!418148 (= res!243605 (and (= (size!12519 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12518 _keys!709) (size!12519 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29092 () Bool)

(declare-fun c!55172 () Bool)

(declare-fun call!29096 () ListLongMap!6023)

(assert (=> bm!29092 (= call!29096 (getCurrentListMapNoExtraKeys!1232 (ite c!55172 _keys!709 lt!191625) (ite c!55172 _values!549 lt!191621) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418149 () Bool)

(declare-fun e!249378 () Bool)

(assert (=> b!418149 (= e!249384 e!249378)))

(declare-fun res!243611 () Bool)

(assert (=> b!418149 (=> (not res!243611) (not e!249378))))

(assert (=> b!418149 (= res!243611 (= from!863 i!563))))

(assert (=> b!418149 (= lt!191624 (getCurrentListMapNoExtraKeys!1232 lt!191625 lt!191621 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418149 (= lt!191621 (array!25436 (store (arr!12167 _values!549) i!563 (ValueCellFull!5052 v!412)) (size!12519 _values!549)))))

(declare-fun lt!191623 () ListLongMap!6023)

(assert (=> b!418149 (= lt!191623 (getCurrentListMapNoExtraKeys!1232 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418150 () Bool)

(declare-fun res!243606 () Bool)

(assert (=> b!418150 (=> (not res!243606) (not e!249384))))

(assert (=> b!418150 (= res!243606 (bvsle from!863 i!563))))

(declare-fun b!418151 () Bool)

(assert (=> b!418151 (= e!249379 (and e!249383 mapRes!17808))))

(declare-fun condMapEmpty!17808 () Bool)

(declare-fun mapDefault!17808 () ValueCell!5052)

(assert (=> b!418151 (= condMapEmpty!17808 (= (arr!12167 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5052)) mapDefault!17808)))))

(declare-fun call!29095 () ListLongMap!6023)

(declare-fun b!418152 () Bool)

(declare-fun e!249377 () Bool)

(assert (=> b!418152 (= e!249377 (= call!29095 (+!1227 call!29096 (tuple2!7111 k0!794 v!412))))))

(declare-fun bm!29093 () Bool)

(assert (=> bm!29093 (= call!29095 (getCurrentListMapNoExtraKeys!1232 (ite c!55172 lt!191625 _keys!709) (ite c!55172 lt!191621 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17808 () Bool)

(declare-fun tp!34446 () Bool)

(assert (=> mapNonEmpty!17808 (= mapRes!17808 (and tp!34446 e!249380))))

(declare-fun mapRest!17808 () (Array (_ BitVec 32) ValueCell!5052))

(declare-fun mapKey!17808 () (_ BitVec 32))

(declare-fun mapValue!17808 () ValueCell!5052)

(assert (=> mapNonEmpty!17808 (= (arr!12167 _values!549) (store mapRest!17808 mapKey!17808 mapValue!17808))))

(declare-fun b!418153 () Bool)

(assert (=> b!418153 (= e!249377 (= call!29096 call!29095))))

(declare-fun b!418154 () Bool)

(declare-fun res!243603 () Bool)

(assert (=> b!418154 (=> (not res!243603) (not e!249384))))

(assert (=> b!418154 (= res!243603 (arrayNoDuplicates!0 lt!191625 #b00000000000000000000000000000000 Nil!7121))))

(declare-fun b!418155 () Bool)

(declare-fun res!243610 () Bool)

(assert (=> b!418155 (=> (not res!243610) (not e!249381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418155 (= res!243610 (validMask!0 mask!1025))))

(declare-fun b!418156 () Bool)

(assert (=> b!418156 (= e!249378 (not e!249376))))

(declare-fun res!243602 () Bool)

(assert (=> b!418156 (=> res!243602 e!249376)))

(assert (=> b!418156 (= res!243602 (validKeyInArray!0 (select (arr!12166 _keys!709) from!863)))))

(assert (=> b!418156 e!249377))

(assert (=> b!418156 (= c!55172 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191618 () Unit!12358)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 (array!25433 array!25435 (_ BitVec 32) (_ BitVec 32) V!15493 V!15493 (_ BitVec 32) (_ BitVec 64) V!15493 (_ BitVec 32) Int) Unit!12358)

(assert (=> b!418156 (= lt!191618 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39372 res!243604) b!418155))

(assert (= (and b!418155 res!243610) b!418148))

(assert (= (and b!418148 res!243605) b!418144))

(assert (= (and b!418144 res!243614) b!418139))

(assert (= (and b!418139 res!243609) b!418146))

(assert (= (and b!418146 res!243615) b!418145))

(assert (= (and b!418145 res!243613) b!418141))

(assert (= (and b!418141 res!243607) b!418138))

(assert (= (and b!418138 res!243608) b!418143))

(assert (= (and b!418143 res!243612) b!418154))

(assert (= (and b!418154 res!243603) b!418150))

(assert (= (and b!418150 res!243606) b!418149))

(assert (= (and b!418149 res!243611) b!418156))

(assert (= (and b!418156 c!55172) b!418152))

(assert (= (and b!418156 (not c!55172)) b!418153))

(assert (= (or b!418152 b!418153) bm!29093))

(assert (= (or b!418152 b!418153) bm!29092))

(assert (= (and b!418156 (not res!243602)) b!418142))

(assert (= (and b!418151 condMapEmpty!17808) mapIsEmpty!17808))

(assert (= (and b!418151 (not condMapEmpty!17808)) mapNonEmpty!17808))

(get-info :version)

(assert (= (and mapNonEmpty!17808 ((_ is ValueCellFull!5052) mapValue!17808)) b!418147))

(assert (= (and b!418151 ((_ is ValueCellFull!5052) mapDefault!17808)) b!418140))

(assert (= start!39372 b!418151))

(declare-fun b_lambda!8943 () Bool)

(assert (=> (not b_lambda!8943) (not b!418142)))

(declare-fun t!12427 () Bool)

(declare-fun tb!3261 () Bool)

(assert (=> (and start!39372 (= defaultEntry!557 defaultEntry!557) t!12427) tb!3261))

(declare-fun result!6049 () Bool)

(assert (=> tb!3261 (= result!6049 tp_is_empty!10791)))

(assert (=> b!418142 t!12427))

(declare-fun b_and!17155 () Bool)

(assert (= b_and!17153 (and (=> t!12427 result!6049) b_and!17155)))

(declare-fun m!407489 () Bool)

(assert (=> mapNonEmpty!17808 m!407489))

(declare-fun m!407491 () Bool)

(assert (=> b!418143 m!407491))

(declare-fun m!407493 () Bool)

(assert (=> b!418143 m!407493))

(declare-fun m!407495 () Bool)

(assert (=> bm!29093 m!407495))

(declare-fun m!407497 () Bool)

(assert (=> b!418152 m!407497))

(declare-fun m!407499 () Bool)

(assert (=> b!418154 m!407499))

(declare-fun m!407501 () Bool)

(assert (=> b!418141 m!407501))

(declare-fun m!407503 () Bool)

(assert (=> b!418156 m!407503))

(assert (=> b!418156 m!407503))

(declare-fun m!407505 () Bool)

(assert (=> b!418156 m!407505))

(declare-fun m!407507 () Bool)

(assert (=> b!418156 m!407507))

(declare-fun m!407509 () Bool)

(assert (=> b!418142 m!407509))

(declare-fun m!407511 () Bool)

(assert (=> b!418142 m!407511))

(declare-fun m!407513 () Bool)

(assert (=> b!418142 m!407513))

(declare-fun m!407515 () Bool)

(assert (=> b!418142 m!407515))

(declare-fun m!407517 () Bool)

(assert (=> b!418142 m!407517))

(declare-fun m!407519 () Bool)

(assert (=> b!418142 m!407519))

(declare-fun m!407521 () Bool)

(assert (=> b!418142 m!407521))

(declare-fun m!407523 () Bool)

(assert (=> b!418142 m!407523))

(assert (=> b!418142 m!407519))

(declare-fun m!407525 () Bool)

(assert (=> b!418142 m!407525))

(declare-fun m!407527 () Bool)

(assert (=> b!418142 m!407527))

(assert (=> b!418142 m!407525))

(declare-fun m!407529 () Bool)

(assert (=> b!418142 m!407529))

(assert (=> b!418142 m!407509))

(declare-fun m!407531 () Bool)

(assert (=> b!418142 m!407531))

(declare-fun m!407533 () Bool)

(assert (=> b!418142 m!407533))

(declare-fun m!407535 () Bool)

(assert (=> start!39372 m!407535))

(declare-fun m!407537 () Bool)

(assert (=> start!39372 m!407537))

(declare-fun m!407539 () Bool)

(assert (=> b!418145 m!407539))

(declare-fun m!407541 () Bool)

(assert (=> b!418144 m!407541))

(declare-fun m!407543 () Bool)

(assert (=> b!418138 m!407543))

(declare-fun m!407545 () Bool)

(assert (=> bm!29092 m!407545))

(declare-fun m!407547 () Bool)

(assert (=> b!418139 m!407547))

(declare-fun m!407549 () Bool)

(assert (=> b!418155 m!407549))

(declare-fun m!407551 () Bool)

(assert (=> b!418149 m!407551))

(assert (=> b!418149 m!407515))

(declare-fun m!407553 () Bool)

(assert (=> b!418149 m!407553))

(check-sat (not mapNonEmpty!17808) (not b!418152) (not b_next!9639) b_and!17155 (not b_lambda!8943) (not b!418156) (not bm!29093) (not start!39372) (not bm!29092) (not b!418149) (not b!418143) (not b!418144) tp_is_empty!10791 (not b!418142) (not b!418138) (not b!418145) (not b!418155) (not b!418139) (not b!418154))
(check-sat b_and!17155 (not b_next!9639))
