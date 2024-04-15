; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37692 () Bool)

(assert start!37692)

(declare-fun b_free!8809 () Bool)

(declare-fun b_next!8809 () Bool)

(assert (=> start!37692 (= b_free!8809 (not b_next!8809))))

(declare-fun tp!31179 () Bool)

(declare-fun b_and!16025 () Bool)

(assert (=> start!37692 (= tp!31179 b_and!16025)))

(declare-fun b!386209 () Bool)

(declare-fun res!220510 () Bool)

(declare-fun e!234273 () Bool)

(assert (=> b!386209 (=> (not res!220510) (not e!234273))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22845 0))(
  ( (array!22846 (arr!10891 (Array (_ BitVec 32) (_ BitVec 64))) (size!11244 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22845)

(assert (=> b!386209 (= res!220510 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11244 _keys!658))))))

(declare-fun b!386210 () Bool)

(declare-fun e!234276 () Bool)

(assert (=> b!386210 (= e!234273 e!234276)))

(declare-fun res!220515 () Bool)

(assert (=> b!386210 (=> (not res!220515) (not e!234276))))

(declare-fun lt!181583 () array!22845)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22845 (_ BitVec 32)) Bool)

(assert (=> b!386210 (= res!220515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181583 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!386210 (= lt!181583 (array!22846 (store (arr!10891 _keys!658) i!548 k0!778) (size!11244 _keys!658)))))

(declare-fun b!386211 () Bool)

(assert (=> b!386211 (= e!234276 false)))

(declare-datatypes ((V!13747 0))(
  ( (V!13748 (val!4785 Int)) )
))
(declare-datatypes ((ValueCell!4397 0))(
  ( (ValueCellFull!4397 (v!6976 V!13747)) (EmptyCell!4397) )
))
(declare-datatypes ((array!22847 0))(
  ( (array!22848 (arr!10892 (Array (_ BitVec 32) ValueCell!4397)) (size!11245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22847)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6416 0))(
  ( (tuple2!6417 (_1!3219 (_ BitVec 64)) (_2!3219 V!13747)) )
))
(declare-datatypes ((List!6248 0))(
  ( (Nil!6245) (Cons!6244 (h!7100 tuple2!6416) (t!11389 List!6248)) )
))
(declare-datatypes ((ListLongMap!5319 0))(
  ( (ListLongMap!5320 (toList!2675 List!6248)) )
))
(declare-fun lt!181584 () ListLongMap!5319)

(declare-fun zeroValue!472 () V!13747)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13747)

(declare-fun minValue!472 () V!13747)

(declare-fun getCurrentListMapNoExtraKeys!915 (array!22845 array!22847 (_ BitVec 32) (_ BitVec 32) V!13747 V!13747 (_ BitVec 32) Int) ListLongMap!5319)

(assert (=> b!386211 (= lt!181584 (getCurrentListMapNoExtraKeys!915 lt!181583 (array!22848 (store (arr!10892 _values!506) i!548 (ValueCellFull!4397 v!373)) (size!11245 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181582 () ListLongMap!5319)

(assert (=> b!386211 (= lt!181582 (getCurrentListMapNoExtraKeys!915 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386212 () Bool)

(declare-fun res!220508 () Bool)

(assert (=> b!386212 (=> (not res!220508) (not e!234273))))

(declare-fun arrayContainsKey!0 (array!22845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386212 (= res!220508 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386213 () Bool)

(declare-fun e!234274 () Bool)

(declare-fun tp_is_empty!9481 () Bool)

(assert (=> b!386213 (= e!234274 tp_is_empty!9481)))

(declare-fun b!386214 () Bool)

(declare-fun res!220512 () Bool)

(assert (=> b!386214 (=> (not res!220512) (not e!234273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386214 (= res!220512 (validKeyInArray!0 k0!778))))

(declare-fun b!386215 () Bool)

(declare-fun res!220509 () Bool)

(assert (=> b!386215 (=> (not res!220509) (not e!234273))))

(declare-datatypes ((List!6249 0))(
  ( (Nil!6246) (Cons!6245 (h!7101 (_ BitVec 64)) (t!11390 List!6249)) )
))
(declare-fun arrayNoDuplicates!0 (array!22845 (_ BitVec 32) List!6249) Bool)

(assert (=> b!386215 (= res!220509 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6246))))

(declare-fun b!386216 () Bool)

(declare-fun res!220511 () Bool)

(assert (=> b!386216 (=> (not res!220511) (not e!234276))))

(assert (=> b!386216 (= res!220511 (arrayNoDuplicates!0 lt!181583 #b00000000000000000000000000000000 Nil!6246))))

(declare-fun b!386217 () Bool)

(declare-fun res!220513 () Bool)

(assert (=> b!386217 (=> (not res!220513) (not e!234273))))

(assert (=> b!386217 (= res!220513 (and (= (size!11245 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11244 _keys!658) (size!11245 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386218 () Bool)

(declare-fun e!234277 () Bool)

(declare-fun mapRes!15786 () Bool)

(assert (=> b!386218 (= e!234277 (and e!234274 mapRes!15786))))

(declare-fun condMapEmpty!15786 () Bool)

(declare-fun mapDefault!15786 () ValueCell!4397)

(assert (=> b!386218 (= condMapEmpty!15786 (= (arr!10892 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4397)) mapDefault!15786)))))

(declare-fun mapIsEmpty!15786 () Bool)

(assert (=> mapIsEmpty!15786 mapRes!15786))

(declare-fun b!386219 () Bool)

(declare-fun res!220516 () Bool)

(assert (=> b!386219 (=> (not res!220516) (not e!234273))))

(assert (=> b!386219 (= res!220516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386220 () Bool)

(declare-fun res!220517 () Bool)

(assert (=> b!386220 (=> (not res!220517) (not e!234273))))

(assert (=> b!386220 (= res!220517 (or (= (select (arr!10891 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10891 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220514 () Bool)

(assert (=> start!37692 (=> (not res!220514) (not e!234273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37692 (= res!220514 (validMask!0 mask!970))))

(assert (=> start!37692 e!234273))

(declare-fun array_inv!8014 (array!22847) Bool)

(assert (=> start!37692 (and (array_inv!8014 _values!506) e!234277)))

(assert (=> start!37692 tp!31179))

(assert (=> start!37692 true))

(assert (=> start!37692 tp_is_empty!9481))

(declare-fun array_inv!8015 (array!22845) Bool)

(assert (=> start!37692 (array_inv!8015 _keys!658)))

(declare-fun b!386221 () Bool)

(declare-fun e!234275 () Bool)

(assert (=> b!386221 (= e!234275 tp_is_empty!9481)))

(declare-fun mapNonEmpty!15786 () Bool)

(declare-fun tp!31178 () Bool)

(assert (=> mapNonEmpty!15786 (= mapRes!15786 (and tp!31178 e!234275))))

(declare-fun mapKey!15786 () (_ BitVec 32))

(declare-fun mapValue!15786 () ValueCell!4397)

(declare-fun mapRest!15786 () (Array (_ BitVec 32) ValueCell!4397))

(assert (=> mapNonEmpty!15786 (= (arr!10892 _values!506) (store mapRest!15786 mapKey!15786 mapValue!15786))))

(assert (= (and start!37692 res!220514) b!386217))

(assert (= (and b!386217 res!220513) b!386219))

(assert (= (and b!386219 res!220516) b!386215))

(assert (= (and b!386215 res!220509) b!386209))

(assert (= (and b!386209 res!220510) b!386214))

(assert (= (and b!386214 res!220512) b!386220))

(assert (= (and b!386220 res!220517) b!386212))

(assert (= (and b!386212 res!220508) b!386210))

(assert (= (and b!386210 res!220515) b!386216))

(assert (= (and b!386216 res!220511) b!386211))

(assert (= (and b!386218 condMapEmpty!15786) mapIsEmpty!15786))

(assert (= (and b!386218 (not condMapEmpty!15786)) mapNonEmpty!15786))

(get-info :version)

(assert (= (and mapNonEmpty!15786 ((_ is ValueCellFull!4397) mapValue!15786)) b!386221))

(assert (= (and b!386218 ((_ is ValueCellFull!4397) mapDefault!15786)) b!386213))

(assert (= start!37692 b!386218))

(declare-fun m!382091 () Bool)

(assert (=> mapNonEmpty!15786 m!382091))

(declare-fun m!382093 () Bool)

(assert (=> b!386220 m!382093))

(declare-fun m!382095 () Bool)

(assert (=> b!386210 m!382095))

(declare-fun m!382097 () Bool)

(assert (=> b!386210 m!382097))

(declare-fun m!382099 () Bool)

(assert (=> b!386212 m!382099))

(declare-fun m!382101 () Bool)

(assert (=> b!386219 m!382101))

(declare-fun m!382103 () Bool)

(assert (=> b!386215 m!382103))

(declare-fun m!382105 () Bool)

(assert (=> b!386214 m!382105))

(declare-fun m!382107 () Bool)

(assert (=> b!386216 m!382107))

(declare-fun m!382109 () Bool)

(assert (=> b!386211 m!382109))

(declare-fun m!382111 () Bool)

(assert (=> b!386211 m!382111))

(declare-fun m!382113 () Bool)

(assert (=> b!386211 m!382113))

(declare-fun m!382115 () Bool)

(assert (=> start!37692 m!382115))

(declare-fun m!382117 () Bool)

(assert (=> start!37692 m!382117))

(declare-fun m!382119 () Bool)

(assert (=> start!37692 m!382119))

(check-sat (not b!386219) (not mapNonEmpty!15786) (not b!386212) (not start!37692) (not b!386210) (not b!386215) b_and!16025 (not b!386211) (not b!386216) tp_is_empty!9481 (not b_next!8809) (not b!386214))
(check-sat b_and!16025 (not b_next!8809))
