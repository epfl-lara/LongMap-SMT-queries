; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40978 () Bool)

(assert start!40978)

(declare-fun b_free!10927 () Bool)

(declare-fun b_next!10927 () Bool)

(assert (=> start!40978 (= b_free!10927 (not b_next!10927))))

(declare-fun tp!38608 () Bool)

(declare-fun b_and!19079 () Bool)

(assert (=> start!40978 (= tp!38608 b_and!19079)))

(declare-fun b!456432 () Bool)

(declare-fun res!272407 () Bool)

(declare-fun e!266668 () Bool)

(assert (=> b!456432 (=> (not res!272407) (not e!266668))))

(declare-datatypes ((array!28324 0))(
  ( (array!28325 (arr!13605 (Array (_ BitVec 32) (_ BitVec 64))) (size!13957 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28324)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28324 (_ BitVec 32)) Bool)

(assert (=> b!456432 (= res!272407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456433 () Bool)

(declare-fun e!266671 () Bool)

(declare-fun tp_is_empty!12265 () Bool)

(assert (=> b!456433 (= e!266671 tp_is_empty!12265)))

(declare-fun b!456434 () Bool)

(declare-fun res!272416 () Bool)

(assert (=> b!456434 (=> (not res!272416) (not e!266668))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456434 (= res!272416 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456435 () Bool)

(declare-fun res!272414 () Bool)

(assert (=> b!456435 (=> (not res!272414) (not e!266668))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17459 0))(
  ( (V!17460 (val!6177 Int)) )
))
(declare-datatypes ((ValueCell!5789 0))(
  ( (ValueCellFull!5789 (v!8444 V!17459)) (EmptyCell!5789) )
))
(declare-datatypes ((array!28326 0))(
  ( (array!28327 (arr!13606 (Array (_ BitVec 32) ValueCell!5789)) (size!13958 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28326)

(assert (=> b!456435 (= res!272414 (and (= (size!13958 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13957 _keys!709) (size!13958 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20038 () Bool)

(declare-fun mapRes!20038 () Bool)

(assert (=> mapIsEmpty!20038 mapRes!20038))

(declare-fun b!456436 () Bool)

(declare-fun res!272408 () Bool)

(declare-fun e!266672 () Bool)

(assert (=> b!456436 (=> (not res!272408) (not e!266672))))

(declare-fun lt!206582 () array!28324)

(declare-datatypes ((List!8124 0))(
  ( (Nil!8121) (Cons!8120 (h!8976 (_ BitVec 64)) (t!13944 List!8124)) )
))
(declare-fun arrayNoDuplicates!0 (array!28324 (_ BitVec 32) List!8124) Bool)

(assert (=> b!456436 (= res!272408 (arrayNoDuplicates!0 lt!206582 #b00000000000000000000000000000000 Nil!8121))))

(declare-fun b!456437 () Bool)

(declare-fun res!272405 () Bool)

(assert (=> b!456437 (=> (not res!272405) (not e!266672))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456437 (= res!272405 (bvsle from!863 i!563))))

(declare-fun b!456438 () Bool)

(declare-fun e!266669 () Bool)

(declare-fun e!266670 () Bool)

(assert (=> b!456438 (= e!266669 (and e!266670 mapRes!20038))))

(declare-fun condMapEmpty!20038 () Bool)

(declare-fun mapDefault!20038 () ValueCell!5789)

(assert (=> b!456438 (= condMapEmpty!20038 (= (arr!13606 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5789)) mapDefault!20038)))))

(declare-fun b!456439 () Bool)

(declare-fun res!272410 () Bool)

(assert (=> b!456439 (=> (not res!272410) (not e!266668))))

(assert (=> b!456439 (= res!272410 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13957 _keys!709))))))

(declare-fun b!456441 () Bool)

(declare-fun e!266673 () Bool)

(assert (=> b!456441 (= e!266673 (not true))))

(declare-fun minValue!515 () V!17459)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17459)

(declare-fun lt!206581 () array!28326)

(declare-fun v!412 () V!17459)

(declare-datatypes ((tuple2!8050 0))(
  ( (tuple2!8051 (_1!4036 (_ BitVec 64)) (_2!4036 V!17459)) )
))
(declare-datatypes ((List!8125 0))(
  ( (Nil!8122) (Cons!8121 (h!8977 tuple2!8050) (t!13945 List!8125)) )
))
(declare-datatypes ((ListLongMap!6965 0))(
  ( (ListLongMap!6966 (toList!3498 List!8125)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1727 (array!28324 array!28326 (_ BitVec 32) (_ BitVec 32) V!17459 V!17459 (_ BitVec 32) Int) ListLongMap!6965)

(declare-fun +!1581 (ListLongMap!6965 tuple2!8050) ListLongMap!6965)

(assert (=> b!456441 (= (getCurrentListMapNoExtraKeys!1727 lt!206582 lt!206581 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1581 (getCurrentListMapNoExtraKeys!1727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8051 k0!794 v!412)))))

(declare-datatypes ((Unit!13267 0))(
  ( (Unit!13268) )
))
(declare-fun lt!206580 () Unit!13267)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 (array!28324 array!28326 (_ BitVec 32) (_ BitVec 32) V!17459 V!17459 (_ BitVec 32) (_ BitVec 64) V!17459 (_ BitVec 32) Int) Unit!13267)

(assert (=> b!456441 (= lt!206580 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456442 () Bool)

(assert (=> b!456442 (= e!266668 e!266672)))

(declare-fun res!272413 () Bool)

(assert (=> b!456442 (=> (not res!272413) (not e!266672))))

(assert (=> b!456442 (= res!272413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206582 mask!1025))))

(assert (=> b!456442 (= lt!206582 (array!28325 (store (arr!13605 _keys!709) i!563 k0!794) (size!13957 _keys!709)))))

(declare-fun b!456443 () Bool)

(declare-fun res!272406 () Bool)

(assert (=> b!456443 (=> (not res!272406) (not e!266668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456443 (= res!272406 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!20038 () Bool)

(declare-fun tp!38607 () Bool)

(assert (=> mapNonEmpty!20038 (= mapRes!20038 (and tp!38607 e!266671))))

(declare-fun mapValue!20038 () ValueCell!5789)

(declare-fun mapRest!20038 () (Array (_ BitVec 32) ValueCell!5789))

(declare-fun mapKey!20038 () (_ BitVec 32))

(assert (=> mapNonEmpty!20038 (= (arr!13606 _values!549) (store mapRest!20038 mapKey!20038 mapValue!20038))))

(declare-fun b!456444 () Bool)

(declare-fun res!272415 () Bool)

(assert (=> b!456444 (=> (not res!272415) (not e!266668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456444 (= res!272415 (validKeyInArray!0 k0!794))))

(declare-fun b!456445 () Bool)

(assert (=> b!456445 (= e!266670 tp_is_empty!12265)))

(declare-fun b!456446 () Bool)

(declare-fun res!272412 () Bool)

(assert (=> b!456446 (=> (not res!272412) (not e!266668))))

(assert (=> b!456446 (= res!272412 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8121))))

(declare-fun b!456447 () Bool)

(assert (=> b!456447 (= e!266672 e!266673)))

(declare-fun res!272411 () Bool)

(assert (=> b!456447 (=> (not res!272411) (not e!266673))))

(assert (=> b!456447 (= res!272411 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206578 () ListLongMap!6965)

(assert (=> b!456447 (= lt!206578 (getCurrentListMapNoExtraKeys!1727 lt!206582 lt!206581 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456447 (= lt!206581 (array!28327 (store (arr!13606 _values!549) i!563 (ValueCellFull!5789 v!412)) (size!13958 _values!549)))))

(declare-fun lt!206579 () ListLongMap!6965)

(assert (=> b!456447 (= lt!206579 (getCurrentListMapNoExtraKeys!1727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456440 () Bool)

(declare-fun res!272404 () Bool)

(assert (=> b!456440 (=> (not res!272404) (not e!266668))))

(assert (=> b!456440 (= res!272404 (or (= (select (arr!13605 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13605 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!272409 () Bool)

(assert (=> start!40978 (=> (not res!272409) (not e!266668))))

(assert (=> start!40978 (= res!272409 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13957 _keys!709))))))

(assert (=> start!40978 e!266668))

(assert (=> start!40978 tp_is_empty!12265))

(assert (=> start!40978 tp!38608))

(assert (=> start!40978 true))

(declare-fun array_inv!9922 (array!28326) Bool)

(assert (=> start!40978 (and (array_inv!9922 _values!549) e!266669)))

(declare-fun array_inv!9923 (array!28324) Bool)

(assert (=> start!40978 (array_inv!9923 _keys!709)))

(assert (= (and start!40978 res!272409) b!456443))

(assert (= (and b!456443 res!272406) b!456435))

(assert (= (and b!456435 res!272414) b!456432))

(assert (= (and b!456432 res!272407) b!456446))

(assert (= (and b!456446 res!272412) b!456439))

(assert (= (and b!456439 res!272410) b!456444))

(assert (= (and b!456444 res!272415) b!456440))

(assert (= (and b!456440 res!272404) b!456434))

(assert (= (and b!456434 res!272416) b!456442))

(assert (= (and b!456442 res!272413) b!456436))

(assert (= (and b!456436 res!272408) b!456437))

(assert (= (and b!456437 res!272405) b!456447))

(assert (= (and b!456447 res!272411) b!456441))

(assert (= (and b!456438 condMapEmpty!20038) mapIsEmpty!20038))

(assert (= (and b!456438 (not condMapEmpty!20038)) mapNonEmpty!20038))

(get-info :version)

(assert (= (and mapNonEmpty!20038 ((_ is ValueCellFull!5789) mapValue!20038)) b!456433))

(assert (= (and b!456438 ((_ is ValueCellFull!5789) mapDefault!20038)) b!456445))

(assert (= start!40978 b!456438))

(declare-fun m!440127 () Bool)

(assert (=> b!456436 m!440127))

(declare-fun m!440129 () Bool)

(assert (=> b!456447 m!440129))

(declare-fun m!440131 () Bool)

(assert (=> b!456447 m!440131))

(declare-fun m!440133 () Bool)

(assert (=> b!456447 m!440133))

(declare-fun m!440135 () Bool)

(assert (=> b!456442 m!440135))

(declare-fun m!440137 () Bool)

(assert (=> b!456442 m!440137))

(declare-fun m!440139 () Bool)

(assert (=> b!456446 m!440139))

(declare-fun m!440141 () Bool)

(assert (=> b!456432 m!440141))

(declare-fun m!440143 () Bool)

(assert (=> b!456434 m!440143))

(declare-fun m!440145 () Bool)

(assert (=> b!456443 m!440145))

(declare-fun m!440147 () Bool)

(assert (=> start!40978 m!440147))

(declare-fun m!440149 () Bool)

(assert (=> start!40978 m!440149))

(declare-fun m!440151 () Bool)

(assert (=> b!456440 m!440151))

(declare-fun m!440153 () Bool)

(assert (=> b!456441 m!440153))

(declare-fun m!440155 () Bool)

(assert (=> b!456441 m!440155))

(assert (=> b!456441 m!440155))

(declare-fun m!440157 () Bool)

(assert (=> b!456441 m!440157))

(declare-fun m!440159 () Bool)

(assert (=> b!456441 m!440159))

(declare-fun m!440161 () Bool)

(assert (=> mapNonEmpty!20038 m!440161))

(declare-fun m!440163 () Bool)

(assert (=> b!456444 m!440163))

(check-sat (not b!456442) (not start!40978) (not b!456436) b_and!19079 (not b_next!10927) (not b!456441) (not b!456444) (not b!456434) tp_is_empty!12265 (not b!456432) (not b!456446) (not mapNonEmpty!20038) (not b!456447) (not b!456443))
(check-sat b_and!19079 (not b_next!10927))
