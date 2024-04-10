; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37690 () Bool)

(assert start!37690)

(declare-fun b_free!8793 () Bool)

(declare-fun b_next!8793 () Bool)

(assert (=> start!37690 (= b_free!8793 (not b_next!8793))))

(declare-fun tp!31130 () Bool)

(declare-fun b_and!16035 () Bool)

(assert (=> start!37690 (= tp!31130 b_and!16035)))

(declare-fun b!386168 () Bool)

(declare-fun res!220400 () Bool)

(declare-fun e!234305 () Bool)

(assert (=> b!386168 (=> (not res!220400) (not e!234305))))

(declare-datatypes ((array!22829 0))(
  ( (array!22830 (arr!10883 (Array (_ BitVec 32) (_ BitVec 64))) (size!11235 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22829)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386168 (= res!220400 (or (= (select (arr!10883 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10883 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386169 () Bool)

(declare-fun res!220404 () Bool)

(assert (=> b!386169 (=> (not res!220404) (not e!234305))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386169 (= res!220404 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15762 () Bool)

(declare-fun mapRes!15762 () Bool)

(declare-fun tp!31131 () Bool)

(declare-fun e!234304 () Bool)

(assert (=> mapNonEmpty!15762 (= mapRes!15762 (and tp!31131 e!234304))))

(declare-datatypes ((V!13725 0))(
  ( (V!13726 (val!4777 Int)) )
))
(declare-datatypes ((ValueCell!4389 0))(
  ( (ValueCellFull!4389 (v!6974 V!13725)) (EmptyCell!4389) )
))
(declare-fun mapRest!15762 () (Array (_ BitVec 32) ValueCell!4389))

(declare-datatypes ((array!22831 0))(
  ( (array!22832 (arr!10884 (Array (_ BitVec 32) ValueCell!4389)) (size!11236 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22831)

(declare-fun mapValue!15762 () ValueCell!4389)

(declare-fun mapKey!15762 () (_ BitVec 32))

(assert (=> mapNonEmpty!15762 (= (arr!10884 _values!506) (store mapRest!15762 mapKey!15762 mapValue!15762))))

(declare-fun b!386170 () Bool)

(declare-fun tp_is_empty!9465 () Bool)

(assert (=> b!386170 (= e!234304 tp_is_empty!9465)))

(declare-fun mapIsEmpty!15762 () Bool)

(assert (=> mapIsEmpty!15762 mapRes!15762))

(declare-fun b!386171 () Bool)

(declare-fun res!220406 () Bool)

(assert (=> b!386171 (=> (not res!220406) (not e!234305))))

(declare-datatypes ((List!6268 0))(
  ( (Nil!6265) (Cons!6264 (h!7120 (_ BitVec 64)) (t!11418 List!6268)) )
))
(declare-fun arrayNoDuplicates!0 (array!22829 (_ BitVec 32) List!6268) Bool)

(assert (=> b!386171 (= res!220406 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6265))))

(declare-fun b!386172 () Bool)

(declare-fun res!220399 () Bool)

(assert (=> b!386172 (=> (not res!220399) (not e!234305))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22829 (_ BitVec 32)) Bool)

(assert (=> b!386172 (= res!220399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386173 () Bool)

(declare-fun res!220397 () Bool)

(declare-fun e!234307 () Bool)

(assert (=> b!386173 (=> (not res!220397) (not e!234307))))

(declare-fun lt!181744 () array!22829)

(assert (=> b!386173 (= res!220397 (arrayNoDuplicates!0 lt!181744 #b00000000000000000000000000000000 Nil!6265))))

(declare-fun b!386174 () Bool)

(declare-fun e!234306 () Bool)

(declare-fun e!234303 () Bool)

(assert (=> b!386174 (= e!234306 (and e!234303 mapRes!15762))))

(declare-fun condMapEmpty!15762 () Bool)

(declare-fun mapDefault!15762 () ValueCell!4389)

(assert (=> b!386174 (= condMapEmpty!15762 (= (arr!10884 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4389)) mapDefault!15762)))))

(declare-fun b!386175 () Bool)

(assert (=> b!386175 (= e!234305 e!234307)))

(declare-fun res!220401 () Bool)

(assert (=> b!386175 (=> (not res!220401) (not e!234307))))

(assert (=> b!386175 (= res!220401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181744 mask!970))))

(assert (=> b!386175 (= lt!181744 (array!22830 (store (arr!10883 _keys!658) i!548 k0!778) (size!11235 _keys!658)))))

(declare-fun b!386176 () Bool)

(declare-fun res!220402 () Bool)

(assert (=> b!386176 (=> (not res!220402) (not e!234305))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386176 (= res!220402 (and (= (size!11236 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11235 _keys!658) (size!11236 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!220403 () Bool)

(assert (=> start!37690 (=> (not res!220403) (not e!234305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37690 (= res!220403 (validMask!0 mask!970))))

(assert (=> start!37690 e!234305))

(declare-fun array_inv!8008 (array!22831) Bool)

(assert (=> start!37690 (and (array_inv!8008 _values!506) e!234306)))

(assert (=> start!37690 tp!31130))

(assert (=> start!37690 true))

(assert (=> start!37690 tp_is_empty!9465))

(declare-fun array_inv!8009 (array!22829) Bool)

(assert (=> start!37690 (array_inv!8009 _keys!658)))

(declare-fun b!386177 () Bool)

(declare-fun res!220405 () Bool)

(assert (=> b!386177 (=> (not res!220405) (not e!234305))))

(assert (=> b!386177 (= res!220405 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11235 _keys!658))))))

(declare-fun b!386178 () Bool)

(assert (=> b!386178 (= e!234307 false)))

(declare-datatypes ((tuple2!6422 0))(
  ( (tuple2!6423 (_1!3222 (_ BitVec 64)) (_2!3222 V!13725)) )
))
(declare-datatypes ((List!6269 0))(
  ( (Nil!6266) (Cons!6265 (h!7121 tuple2!6422) (t!11419 List!6269)) )
))
(declare-datatypes ((ListLongMap!5335 0))(
  ( (ListLongMap!5336 (toList!2683 List!6269)) )
))
(declare-fun lt!181745 () ListLongMap!5335)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13725)

(declare-fun v!373 () V!13725)

(declare-fun minValue!472 () V!13725)

(declare-fun getCurrentListMapNoExtraKeys!912 (array!22829 array!22831 (_ BitVec 32) (_ BitVec 32) V!13725 V!13725 (_ BitVec 32) Int) ListLongMap!5335)

(assert (=> b!386178 (= lt!181745 (getCurrentListMapNoExtraKeys!912 lt!181744 (array!22832 (store (arr!10884 _values!506) i!548 (ValueCellFull!4389 v!373)) (size!11236 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181746 () ListLongMap!5335)

(assert (=> b!386178 (= lt!181746 (getCurrentListMapNoExtraKeys!912 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386179 () Bool)

(assert (=> b!386179 (= e!234303 tp_is_empty!9465)))

(declare-fun b!386180 () Bool)

(declare-fun res!220398 () Bool)

(assert (=> b!386180 (=> (not res!220398) (not e!234305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386180 (= res!220398 (validKeyInArray!0 k0!778))))

(assert (= (and start!37690 res!220403) b!386176))

(assert (= (and b!386176 res!220402) b!386172))

(assert (= (and b!386172 res!220399) b!386171))

(assert (= (and b!386171 res!220406) b!386177))

(assert (= (and b!386177 res!220405) b!386180))

(assert (= (and b!386180 res!220398) b!386168))

(assert (= (and b!386168 res!220400) b!386169))

(assert (= (and b!386169 res!220404) b!386175))

(assert (= (and b!386175 res!220401) b!386173))

(assert (= (and b!386173 res!220397) b!386178))

(assert (= (and b!386174 condMapEmpty!15762) mapIsEmpty!15762))

(assert (= (and b!386174 (not condMapEmpty!15762)) mapNonEmpty!15762))

(get-info :version)

(assert (= (and mapNonEmpty!15762 ((_ is ValueCellFull!4389) mapValue!15762)) b!386170))

(assert (= (and b!386174 ((_ is ValueCellFull!4389) mapDefault!15762)) b!386179))

(assert (= start!37690 b!386174))

(declare-fun m!382575 () Bool)

(assert (=> mapNonEmpty!15762 m!382575))

(declare-fun m!382577 () Bool)

(assert (=> b!386180 m!382577))

(declare-fun m!382579 () Bool)

(assert (=> b!386168 m!382579))

(declare-fun m!382581 () Bool)

(assert (=> b!386172 m!382581))

(declare-fun m!382583 () Bool)

(assert (=> b!386178 m!382583))

(declare-fun m!382585 () Bool)

(assert (=> b!386178 m!382585))

(declare-fun m!382587 () Bool)

(assert (=> b!386178 m!382587))

(declare-fun m!382589 () Bool)

(assert (=> b!386173 m!382589))

(declare-fun m!382591 () Bool)

(assert (=> start!37690 m!382591))

(declare-fun m!382593 () Bool)

(assert (=> start!37690 m!382593))

(declare-fun m!382595 () Bool)

(assert (=> start!37690 m!382595))

(declare-fun m!382597 () Bool)

(assert (=> b!386169 m!382597))

(declare-fun m!382599 () Bool)

(assert (=> b!386171 m!382599))

(declare-fun m!382601 () Bool)

(assert (=> b!386175 m!382601))

(declare-fun m!382603 () Bool)

(assert (=> b!386175 m!382603))

(check-sat (not b_next!8793) b_and!16035 (not b!386172) (not mapNonEmpty!15762) (not start!37690) tp_is_empty!9465 (not b!386173) (not b!386171) (not b!386178) (not b!386169) (not b!386175) (not b!386180))
(check-sat b_and!16035 (not b_next!8793))
