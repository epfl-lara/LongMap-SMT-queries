; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39216 () Bool)

(assert start!39216)

(declare-fun b_free!9483 () Bool)

(declare-fun b_next!9483 () Bool)

(assert (=> start!39216 (= b_free!9483 (not b_next!9483))))

(declare-fun tp!33977 () Bool)

(declare-fun b_and!16869 () Bool)

(assert (=> start!39216 (= tp!33977 b_and!16869)))

(declare-fun res!240364 () Bool)

(declare-fun e!247305 () Bool)

(assert (=> start!39216 (=> (not res!240364) (not e!247305))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25127 0))(
  ( (array!25128 (arr!12013 (Array (_ BitVec 32) (_ BitVec 64))) (size!12365 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25127)

(assert (=> start!39216 (= res!240364 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12365 _keys!709))))))

(assert (=> start!39216 e!247305))

(declare-fun tp_is_empty!10635 () Bool)

(assert (=> start!39216 tp_is_empty!10635))

(assert (=> start!39216 tp!33977))

(assert (=> start!39216 true))

(declare-datatypes ((V!15285 0))(
  ( (V!15286 (val!5362 Int)) )
))
(declare-datatypes ((ValueCell!4974 0))(
  ( (ValueCellFull!4974 (v!7609 V!15285)) (EmptyCell!4974) )
))
(declare-datatypes ((array!25129 0))(
  ( (array!25130 (arr!12014 (Array (_ BitVec 32) ValueCell!4974)) (size!12366 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25129)

(declare-fun e!247306 () Bool)

(declare-fun array_inv!8762 (array!25129) Bool)

(assert (=> start!39216 (and (array_inv!8762 _values!549) e!247306)))

(declare-fun array_inv!8763 (array!25127) Bool)

(assert (=> start!39216 (array_inv!8763 _keys!709)))

(declare-fun b!413595 () Bool)

(declare-fun res!240362 () Bool)

(declare-fun e!247303 () Bool)

(assert (=> b!413595 (=> (not res!240362) (not e!247303))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413595 (= res!240362 (bvsle from!863 i!563))))

(declare-fun b!413596 () Bool)

(declare-fun e!247308 () Bool)

(assert (=> b!413596 (= e!247303 e!247308)))

(declare-fun res!240357 () Bool)

(assert (=> b!413596 (=> (not res!240357) (not e!247308))))

(assert (=> b!413596 (= res!240357 (= from!863 i!563))))

(declare-fun minValue!515 () V!15285)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6968 0))(
  ( (tuple2!6969 (_1!3495 (_ BitVec 64)) (_2!3495 V!15285)) )
))
(declare-datatypes ((List!6992 0))(
  ( (Nil!6989) (Cons!6988 (h!7844 tuple2!6968) (t!12166 List!6992)) )
))
(declare-datatypes ((ListLongMap!5881 0))(
  ( (ListLongMap!5882 (toList!2956 List!6992)) )
))
(declare-fun lt!189769 () ListLongMap!5881)

(declare-fun lt!189772 () array!25127)

(declare-fun zeroValue!515 () V!15285)

(declare-fun lt!189771 () array!25129)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1163 (array!25127 array!25129 (_ BitVec 32) (_ BitVec 32) V!15285 V!15285 (_ BitVec 32) Int) ListLongMap!5881)

(assert (=> b!413596 (= lt!189769 (getCurrentListMapNoExtraKeys!1163 lt!189772 lt!189771 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15285)

(assert (=> b!413596 (= lt!189771 (array!25130 (store (arr!12014 _values!549) i!563 (ValueCellFull!4974 v!412)) (size!12366 _values!549)))))

(declare-fun lt!189773 () ListLongMap!5881)

(assert (=> b!413596 (= lt!189773 (getCurrentListMapNoExtraKeys!1163 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413597 () Bool)

(declare-fun res!240359 () Bool)

(assert (=> b!413597 (=> (not res!240359) (not e!247305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413597 (= res!240359 (validMask!0 mask!1025))))

(declare-fun b!413598 () Bool)

(declare-fun res!240358 () Bool)

(assert (=> b!413598 (=> (not res!240358) (not e!247305))))

(assert (=> b!413598 (= res!240358 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12365 _keys!709))))))

(declare-fun b!413599 () Bool)

(assert (=> b!413599 (= e!247305 e!247303)))

(declare-fun res!240365 () Bool)

(assert (=> b!413599 (=> (not res!240365) (not e!247303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25127 (_ BitVec 32)) Bool)

(assert (=> b!413599 (= res!240365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189772 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413599 (= lt!189772 (array!25128 (store (arr!12013 _keys!709) i!563 k0!794) (size!12365 _keys!709)))))

(declare-fun b!413600 () Bool)

(declare-fun res!240366 () Bool)

(assert (=> b!413600 (=> (not res!240366) (not e!247305))))

(declare-datatypes ((List!6993 0))(
  ( (Nil!6990) (Cons!6989 (h!7845 (_ BitVec 64)) (t!12167 List!6993)) )
))
(declare-fun arrayNoDuplicates!0 (array!25127 (_ BitVec 32) List!6993) Bool)

(assert (=> b!413600 (= res!240366 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6990))))

(declare-fun b!413601 () Bool)

(declare-fun e!247301 () Bool)

(declare-fun call!28627 () ListLongMap!5881)

(declare-fun call!28628 () ListLongMap!5881)

(assert (=> b!413601 (= e!247301 (= call!28627 call!28628))))

(declare-fun b!413602 () Bool)

(declare-fun res!240360 () Bool)

(assert (=> b!413602 (=> (not res!240360) (not e!247305))))

(assert (=> b!413602 (= res!240360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17574 () Bool)

(declare-fun mapRes!17574 () Bool)

(declare-fun tp!33978 () Bool)

(declare-fun e!247307 () Bool)

(assert (=> mapNonEmpty!17574 (= mapRes!17574 (and tp!33978 e!247307))))

(declare-fun mapValue!17574 () ValueCell!4974)

(declare-fun mapKey!17574 () (_ BitVec 32))

(declare-fun mapRest!17574 () (Array (_ BitVec 32) ValueCell!4974))

(assert (=> mapNonEmpty!17574 (= (arr!12014 _values!549) (store mapRest!17574 mapKey!17574 mapValue!17574))))

(declare-fun b!413603 () Bool)

(declare-fun res!240363 () Bool)

(assert (=> b!413603 (=> (not res!240363) (not e!247305))))

(assert (=> b!413603 (= res!240363 (or (= (select (arr!12013 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12013 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413604 () Bool)

(declare-fun +!1166 (ListLongMap!5881 tuple2!6968) ListLongMap!5881)

(assert (=> b!413604 (= e!247301 (= call!28628 (+!1166 call!28627 (tuple2!6969 k0!794 v!412))))))

(declare-fun c!54938 () Bool)

(declare-fun bm!28624 () Bool)

(assert (=> bm!28624 (= call!28627 (getCurrentListMapNoExtraKeys!1163 (ite c!54938 _keys!709 lt!189772) (ite c!54938 _values!549 lt!189771) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17574 () Bool)

(assert (=> mapIsEmpty!17574 mapRes!17574))

(declare-fun b!413605 () Bool)

(declare-fun e!247304 () Bool)

(assert (=> b!413605 (= e!247304 tp_is_empty!10635)))

(declare-fun b!413606 () Bool)

(assert (=> b!413606 (= e!247307 tp_is_empty!10635)))

(declare-fun b!413607 () Bool)

(declare-fun res!240361 () Bool)

(assert (=> b!413607 (=> (not res!240361) (not e!247305))))

(assert (=> b!413607 (= res!240361 (and (= (size!12366 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12365 _keys!709) (size!12366 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413608 () Bool)

(declare-fun res!240369 () Bool)

(assert (=> b!413608 (=> (not res!240369) (not e!247305))))

(declare-fun arrayContainsKey!0 (array!25127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413608 (= res!240369 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413609 () Bool)

(assert (=> b!413609 (= e!247308 (not true))))

(assert (=> b!413609 e!247301))

(assert (=> b!413609 (= c!54938 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12236 0))(
  ( (Unit!12237) )
))
(declare-fun lt!189770 () Unit!12236)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 (array!25127 array!25129 (_ BitVec 32) (_ BitVec 32) V!15285 V!15285 (_ BitVec 32) (_ BitVec 64) V!15285 (_ BitVec 32) Int) Unit!12236)

(assert (=> b!413609 (= lt!189770 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413610 () Bool)

(declare-fun res!240367 () Bool)

(assert (=> b!413610 (=> (not res!240367) (not e!247303))))

(assert (=> b!413610 (= res!240367 (arrayNoDuplicates!0 lt!189772 #b00000000000000000000000000000000 Nil!6990))))

(declare-fun b!413611 () Bool)

(assert (=> b!413611 (= e!247306 (and e!247304 mapRes!17574))))

(declare-fun condMapEmpty!17574 () Bool)

(declare-fun mapDefault!17574 () ValueCell!4974)

(assert (=> b!413611 (= condMapEmpty!17574 (= (arr!12014 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4974)) mapDefault!17574)))))

(declare-fun b!413612 () Bool)

(declare-fun res!240368 () Bool)

(assert (=> b!413612 (=> (not res!240368) (not e!247305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413612 (= res!240368 (validKeyInArray!0 k0!794))))

(declare-fun bm!28625 () Bool)

(assert (=> bm!28625 (= call!28628 (getCurrentListMapNoExtraKeys!1163 (ite c!54938 lt!189772 _keys!709) (ite c!54938 lt!189771 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39216 res!240364) b!413597))

(assert (= (and b!413597 res!240359) b!413607))

(assert (= (and b!413607 res!240361) b!413602))

(assert (= (and b!413602 res!240360) b!413600))

(assert (= (and b!413600 res!240366) b!413598))

(assert (= (and b!413598 res!240358) b!413612))

(assert (= (and b!413612 res!240368) b!413603))

(assert (= (and b!413603 res!240363) b!413608))

(assert (= (and b!413608 res!240369) b!413599))

(assert (= (and b!413599 res!240365) b!413610))

(assert (= (and b!413610 res!240367) b!413595))

(assert (= (and b!413595 res!240362) b!413596))

(assert (= (and b!413596 res!240357) b!413609))

(assert (= (and b!413609 c!54938) b!413604))

(assert (= (and b!413609 (not c!54938)) b!413601))

(assert (= (or b!413604 b!413601) bm!28625))

(assert (= (or b!413604 b!413601) bm!28624))

(assert (= (and b!413611 condMapEmpty!17574) mapIsEmpty!17574))

(assert (= (and b!413611 (not condMapEmpty!17574)) mapNonEmpty!17574))

(get-info :version)

(assert (= (and mapNonEmpty!17574 ((_ is ValueCellFull!4974) mapValue!17574)) b!413606))

(assert (= (and b!413611 ((_ is ValueCellFull!4974) mapDefault!17574)) b!413605))

(assert (= start!39216 b!413611))

(declare-fun m!403047 () Bool)

(assert (=> b!413597 m!403047))

(declare-fun m!403049 () Bool)

(assert (=> start!39216 m!403049))

(declare-fun m!403051 () Bool)

(assert (=> start!39216 m!403051))

(declare-fun m!403053 () Bool)

(assert (=> mapNonEmpty!17574 m!403053))

(declare-fun m!403055 () Bool)

(assert (=> b!413612 m!403055))

(declare-fun m!403057 () Bool)

(assert (=> b!413599 m!403057))

(declare-fun m!403059 () Bool)

(assert (=> b!413599 m!403059))

(declare-fun m!403061 () Bool)

(assert (=> b!413596 m!403061))

(declare-fun m!403063 () Bool)

(assert (=> b!413596 m!403063))

(declare-fun m!403065 () Bool)

(assert (=> b!413596 m!403065))

(declare-fun m!403067 () Bool)

(assert (=> b!413608 m!403067))

(declare-fun m!403069 () Bool)

(assert (=> bm!28625 m!403069))

(declare-fun m!403071 () Bool)

(assert (=> b!413604 m!403071))

(declare-fun m!403073 () Bool)

(assert (=> b!413602 m!403073))

(declare-fun m!403075 () Bool)

(assert (=> bm!28624 m!403075))

(declare-fun m!403077 () Bool)

(assert (=> b!413609 m!403077))

(declare-fun m!403079 () Bool)

(assert (=> b!413600 m!403079))

(declare-fun m!403081 () Bool)

(assert (=> b!413603 m!403081))

(declare-fun m!403083 () Bool)

(assert (=> b!413610 m!403083))

(check-sat (not b!413599) (not mapNonEmpty!17574) (not b!413609) b_and!16869 tp_is_empty!10635 (not b!413597) (not b!413602) (not b!413610) (not b!413612) (not bm!28625) (not bm!28624) (not b!413604) (not b!413600) (not start!39216) (not b!413608) (not b_next!9483) (not b!413596))
(check-sat b_and!16869 (not b_next!9483))
