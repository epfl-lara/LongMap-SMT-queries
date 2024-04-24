; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39608 () Bool)

(assert start!39608)

(declare-fun b_free!9889 () Bool)

(declare-fun b_next!9889 () Bool)

(assert (=> start!39608 (= b_free!9889 (not b_next!9889))))

(declare-fun tp!35196 () Bool)

(declare-fun b_and!17559 () Bool)

(assert (=> start!39608 (= tp!35196 b_and!17559)))

(declare-fun b!424702 () Bool)

(declare-fun res!248523 () Bool)

(declare-fun e!252234 () Bool)

(assert (=> b!424702 (=> (not res!248523) (not e!252234))))

(declare-datatypes ((array!25928 0))(
  ( (array!25929 (arr!12413 (Array (_ BitVec 32) (_ BitVec 64))) (size!12765 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25928)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424702 (= res!248523 (or (= (select (arr!12413 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12413 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18183 () Bool)

(declare-fun mapRes!18183 () Bool)

(assert (=> mapIsEmpty!18183 mapRes!18183))

(declare-fun mapNonEmpty!18183 () Bool)

(declare-fun tp!35195 () Bool)

(declare-fun e!252232 () Bool)

(assert (=> mapNonEmpty!18183 (= mapRes!18183 (and tp!35195 e!252232))))

(declare-datatypes ((V!15827 0))(
  ( (V!15828 (val!5565 Int)) )
))
(declare-datatypes ((ValueCell!5177 0))(
  ( (ValueCellFull!5177 (v!7813 V!15827)) (EmptyCell!5177) )
))
(declare-datatypes ((array!25930 0))(
  ( (array!25931 (arr!12414 (Array (_ BitVec 32) ValueCell!5177)) (size!12766 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25930)

(declare-fun mapRest!18183 () (Array (_ BitVec 32) ValueCell!5177))

(declare-fun mapKey!18183 () (_ BitVec 32))

(declare-fun mapValue!18183 () ValueCell!5177)

(assert (=> mapNonEmpty!18183 (= (arr!12414 _values!549) (store mapRest!18183 mapKey!18183 mapValue!18183))))

(declare-fun b!424703 () Bool)

(declare-fun res!248525 () Bool)

(assert (=> b!424703 (=> (not res!248525) (not e!252234))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424703 (= res!248525 (validMask!0 mask!1025))))

(declare-fun b!424704 () Bool)

(declare-fun res!248524 () Bool)

(assert (=> b!424704 (=> (not res!248524) (not e!252234))))

(declare-datatypes ((List!7206 0))(
  ( (Nil!7203) (Cons!7202 (h!8058 (_ BitVec 64)) (t!12642 List!7206)) )
))
(declare-fun arrayNoDuplicates!0 (array!25928 (_ BitVec 32) List!7206) Bool)

(assert (=> b!424704 (= res!248524 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7203))))

(declare-fun b!424705 () Bool)

(declare-fun e!252230 () Bool)

(assert (=> b!424705 (= e!252230 (not true))))

(declare-fun minValue!515 () V!15827)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15827)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!194454 () array!25930)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!194457 () array!25928)

(declare-fun v!412 () V!15827)

(declare-datatypes ((tuple2!7200 0))(
  ( (tuple2!7201 (_1!3611 (_ BitVec 64)) (_2!3611 V!15827)) )
))
(declare-datatypes ((List!7207 0))(
  ( (Nil!7204) (Cons!7203 (h!8059 tuple2!7200) (t!12643 List!7207)) )
))
(declare-datatypes ((ListLongMap!6115 0))(
  ( (ListLongMap!6116 (toList!3073 List!7207)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1319 (array!25928 array!25930 (_ BitVec 32) (_ BitVec 32) V!15827 V!15827 (_ BitVec 32) Int) ListLongMap!6115)

(declare-fun +!1292 (ListLongMap!6115 tuple2!7200) ListLongMap!6115)

(assert (=> b!424705 (= (getCurrentListMapNoExtraKeys!1319 lt!194457 lt!194454 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1292 (getCurrentListMapNoExtraKeys!1319 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7201 k0!794 v!412)))))

(declare-datatypes ((Unit!12459 0))(
  ( (Unit!12460) )
))
(declare-fun lt!194456 () Unit!12459)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 (array!25928 array!25930 (_ BitVec 32) (_ BitVec 32) V!15827 V!15827 (_ BitVec 32) (_ BitVec 64) V!15827 (_ BitVec 32) Int) Unit!12459)

(assert (=> b!424705 (= lt!194456 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424706 () Bool)

(declare-fun res!248526 () Bool)

(declare-fun e!252235 () Bool)

(assert (=> b!424706 (=> (not res!248526) (not e!252235))))

(assert (=> b!424706 (= res!248526 (bvsle from!863 i!563))))

(declare-fun b!424707 () Bool)

(assert (=> b!424707 (= e!252234 e!252235)))

(declare-fun res!248530 () Bool)

(assert (=> b!424707 (=> (not res!248530) (not e!252235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25928 (_ BitVec 32)) Bool)

(assert (=> b!424707 (= res!248530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194457 mask!1025))))

(assert (=> b!424707 (= lt!194457 (array!25929 (store (arr!12413 _keys!709) i!563 k0!794) (size!12765 _keys!709)))))

(declare-fun b!424708 () Bool)

(declare-fun res!248531 () Bool)

(assert (=> b!424708 (=> (not res!248531) (not e!252234))))

(declare-fun arrayContainsKey!0 (array!25928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424708 (= res!248531 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!248529 () Bool)

(assert (=> start!39608 (=> (not res!248529) (not e!252234))))

(assert (=> start!39608 (= res!248529 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12765 _keys!709))))))

(assert (=> start!39608 e!252234))

(declare-fun tp_is_empty!11041 () Bool)

(assert (=> start!39608 tp_is_empty!11041))

(assert (=> start!39608 tp!35196))

(assert (=> start!39608 true))

(declare-fun e!252229 () Bool)

(declare-fun array_inv!9116 (array!25930) Bool)

(assert (=> start!39608 (and (array_inv!9116 _values!549) e!252229)))

(declare-fun array_inv!9117 (array!25928) Bool)

(assert (=> start!39608 (array_inv!9117 _keys!709)))

(declare-fun b!424709 () Bool)

(declare-fun res!248535 () Bool)

(assert (=> b!424709 (=> (not res!248535) (not e!252235))))

(assert (=> b!424709 (= res!248535 (arrayNoDuplicates!0 lt!194457 #b00000000000000000000000000000000 Nil!7203))))

(declare-fun b!424710 () Bool)

(declare-fun e!252231 () Bool)

(assert (=> b!424710 (= e!252231 tp_is_empty!11041)))

(declare-fun b!424711 () Bool)

(assert (=> b!424711 (= e!252229 (and e!252231 mapRes!18183))))

(declare-fun condMapEmpty!18183 () Bool)

(declare-fun mapDefault!18183 () ValueCell!5177)

(assert (=> b!424711 (= condMapEmpty!18183 (= (arr!12414 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5177)) mapDefault!18183)))))

(declare-fun b!424712 () Bool)

(declare-fun res!248534 () Bool)

(assert (=> b!424712 (=> (not res!248534) (not e!252234))))

(assert (=> b!424712 (= res!248534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424713 () Bool)

(assert (=> b!424713 (= e!252235 e!252230)))

(declare-fun res!248527 () Bool)

(assert (=> b!424713 (=> (not res!248527) (not e!252230))))

(assert (=> b!424713 (= res!248527 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194455 () ListLongMap!6115)

(assert (=> b!424713 (= lt!194455 (getCurrentListMapNoExtraKeys!1319 lt!194457 lt!194454 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!424713 (= lt!194454 (array!25931 (store (arr!12414 _values!549) i!563 (ValueCellFull!5177 v!412)) (size!12766 _values!549)))))

(declare-fun lt!194453 () ListLongMap!6115)

(assert (=> b!424713 (= lt!194453 (getCurrentListMapNoExtraKeys!1319 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424714 () Bool)

(declare-fun res!248532 () Bool)

(assert (=> b!424714 (=> (not res!248532) (not e!252234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424714 (= res!248532 (validKeyInArray!0 k0!794))))

(declare-fun b!424715 () Bool)

(declare-fun res!248528 () Bool)

(assert (=> b!424715 (=> (not res!248528) (not e!252234))))

(assert (=> b!424715 (= res!248528 (and (= (size!12766 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12765 _keys!709) (size!12766 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424716 () Bool)

(declare-fun res!248533 () Bool)

(assert (=> b!424716 (=> (not res!248533) (not e!252234))))

(assert (=> b!424716 (= res!248533 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12765 _keys!709))))))

(declare-fun b!424717 () Bool)

(assert (=> b!424717 (= e!252232 tp_is_empty!11041)))

(assert (= (and start!39608 res!248529) b!424703))

(assert (= (and b!424703 res!248525) b!424715))

(assert (= (and b!424715 res!248528) b!424712))

(assert (= (and b!424712 res!248534) b!424704))

(assert (= (and b!424704 res!248524) b!424716))

(assert (= (and b!424716 res!248533) b!424714))

(assert (= (and b!424714 res!248532) b!424702))

(assert (= (and b!424702 res!248523) b!424708))

(assert (= (and b!424708 res!248531) b!424707))

(assert (= (and b!424707 res!248530) b!424709))

(assert (= (and b!424709 res!248535) b!424706))

(assert (= (and b!424706 res!248526) b!424713))

(assert (= (and b!424713 res!248527) b!424705))

(assert (= (and b!424711 condMapEmpty!18183) mapIsEmpty!18183))

(assert (= (and b!424711 (not condMapEmpty!18183)) mapNonEmpty!18183))

(get-info :version)

(assert (= (and mapNonEmpty!18183 ((_ is ValueCellFull!5177) mapValue!18183)) b!424717))

(assert (= (and b!424711 ((_ is ValueCellFull!5177) mapDefault!18183)) b!424710))

(assert (= start!39608 b!424711))

(declare-fun m!414011 () Bool)

(assert (=> b!424713 m!414011))

(declare-fun m!414013 () Bool)

(assert (=> b!424713 m!414013))

(declare-fun m!414015 () Bool)

(assert (=> b!424713 m!414015))

(declare-fun m!414017 () Bool)

(assert (=> b!424708 m!414017))

(declare-fun m!414019 () Bool)

(assert (=> b!424703 m!414019))

(declare-fun m!414021 () Bool)

(assert (=> b!424707 m!414021))

(declare-fun m!414023 () Bool)

(assert (=> b!424707 m!414023))

(declare-fun m!414025 () Bool)

(assert (=> b!424709 m!414025))

(declare-fun m!414027 () Bool)

(assert (=> b!424714 m!414027))

(declare-fun m!414029 () Bool)

(assert (=> b!424704 m!414029))

(declare-fun m!414031 () Bool)

(assert (=> b!424712 m!414031))

(declare-fun m!414033 () Bool)

(assert (=> b!424702 m!414033))

(declare-fun m!414035 () Bool)

(assert (=> b!424705 m!414035))

(declare-fun m!414037 () Bool)

(assert (=> b!424705 m!414037))

(assert (=> b!424705 m!414037))

(declare-fun m!414039 () Bool)

(assert (=> b!424705 m!414039))

(declare-fun m!414041 () Bool)

(assert (=> b!424705 m!414041))

(declare-fun m!414043 () Bool)

(assert (=> start!39608 m!414043))

(declare-fun m!414045 () Bool)

(assert (=> start!39608 m!414045))

(declare-fun m!414047 () Bool)

(assert (=> mapNonEmpty!18183 m!414047))

(check-sat (not b!424708) (not b!424704) (not b!424703) (not b!424707) (not b!424709) (not b!424712) (not mapNonEmpty!18183) (not b!424714) (not b!424713) (not start!39608) tp_is_empty!11041 (not b_next!9889) (not b!424705) b_and!17559)
(check-sat b_and!17559 (not b_next!9889))
