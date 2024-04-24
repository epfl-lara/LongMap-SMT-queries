; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37722 () Bool)

(assert start!37722)

(declare-fun b_free!8839 () Bool)

(declare-fun b_next!8839 () Bool)

(assert (=> start!37722 (= b_free!8839 (not b_next!8839))))

(declare-fun tp!31269 () Bool)

(declare-fun b_and!16095 () Bool)

(assert (=> start!37722 (= tp!31269 b_and!16095)))

(declare-fun b!387016 () Bool)

(declare-fun res!221092 () Bool)

(declare-fun e!234688 () Bool)

(assert (=> b!387016 (=> (not res!221092) (not e!234688))))

(declare-datatypes ((array!22906 0))(
  ( (array!22907 (arr!10921 (Array (_ BitVec 32) (_ BitVec 64))) (size!11273 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22906)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387016 (= res!221092 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387017 () Bool)

(declare-fun e!234689 () Bool)

(declare-fun tp_is_empty!9511 () Bool)

(assert (=> b!387017 (= e!234689 tp_is_empty!9511)))

(declare-fun b!387018 () Bool)

(declare-fun res!221084 () Bool)

(declare-fun e!234686 () Bool)

(assert (=> b!387018 (=> (not res!221084) (not e!234686))))

(declare-fun lt!181970 () array!22906)

(declare-datatypes ((List!6165 0))(
  ( (Nil!6162) (Cons!6161 (h!7017 (_ BitVec 64)) (t!11307 List!6165)) )
))
(declare-fun arrayNoDuplicates!0 (array!22906 (_ BitVec 32) List!6165) Bool)

(assert (=> b!387018 (= res!221084 (arrayNoDuplicates!0 lt!181970 #b00000000000000000000000000000000 Nil!6162))))

(declare-fun b!387020 () Bool)

(declare-fun res!221093 () Bool)

(assert (=> b!387020 (=> (not res!221093) (not e!234688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387020 (= res!221093 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15831 () Bool)

(declare-fun mapRes!15831 () Bool)

(declare-fun tp!31268 () Bool)

(assert (=> mapNonEmpty!15831 (= mapRes!15831 (and tp!31268 e!234689))))

(declare-datatypes ((V!13787 0))(
  ( (V!13788 (val!4800 Int)) )
))
(declare-datatypes ((ValueCell!4412 0))(
  ( (ValueCellFull!4412 (v!6998 V!13787)) (EmptyCell!4412) )
))
(declare-datatypes ((array!22908 0))(
  ( (array!22909 (arr!10922 (Array (_ BitVec 32) ValueCell!4412)) (size!11274 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22908)

(declare-fun mapValue!15831 () ValueCell!4412)

(declare-fun mapRest!15831 () (Array (_ BitVec 32) ValueCell!4412))

(declare-fun mapKey!15831 () (_ BitVec 32))

(assert (=> mapNonEmpty!15831 (= (arr!10922 _values!506) (store mapRest!15831 mapKey!15831 mapValue!15831))))

(declare-fun mapIsEmpty!15831 () Bool)

(assert (=> mapIsEmpty!15831 mapRes!15831))

(declare-fun b!387021 () Bool)

(declare-fun e!234685 () Bool)

(declare-fun e!234687 () Bool)

(assert (=> b!387021 (= e!234685 (and e!234687 mapRes!15831))))

(declare-fun condMapEmpty!15831 () Bool)

(declare-fun mapDefault!15831 () ValueCell!4412)

(assert (=> b!387021 (= condMapEmpty!15831 (= (arr!10922 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4412)) mapDefault!15831)))))

(declare-fun b!387022 () Bool)

(assert (=> b!387022 (= e!234688 e!234686)))

(declare-fun res!221087 () Bool)

(assert (=> b!387022 (=> (not res!221087) (not e!234686))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22906 (_ BitVec 32)) Bool)

(assert (=> b!387022 (= res!221087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181970 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387022 (= lt!181970 (array!22907 (store (arr!10921 _keys!658) i!548 k0!778) (size!11273 _keys!658)))))

(declare-fun b!387023 () Bool)

(assert (=> b!387023 (= e!234686 false)))

(declare-datatypes ((tuple2!6318 0))(
  ( (tuple2!6319 (_1!3170 (_ BitVec 64)) (_2!3170 V!13787)) )
))
(declare-datatypes ((List!6166 0))(
  ( (Nil!6163) (Cons!6162 (h!7018 tuple2!6318) (t!11308 List!6166)) )
))
(declare-datatypes ((ListLongMap!5233 0))(
  ( (ListLongMap!5234 (toList!2632 List!6166)) )
))
(declare-fun lt!181971 () ListLongMap!5233)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13787)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13787)

(declare-fun minValue!472 () V!13787)

(declare-fun getCurrentListMapNoExtraKeys!907 (array!22906 array!22908 (_ BitVec 32) (_ BitVec 32) V!13787 V!13787 (_ BitVec 32) Int) ListLongMap!5233)

(assert (=> b!387023 (= lt!181971 (getCurrentListMapNoExtraKeys!907 lt!181970 (array!22909 (store (arr!10922 _values!506) i!548 (ValueCellFull!4412 v!373)) (size!11274 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181972 () ListLongMap!5233)

(assert (=> b!387023 (= lt!181972 (getCurrentListMapNoExtraKeys!907 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387024 () Bool)

(declare-fun res!221091 () Bool)

(assert (=> b!387024 (=> (not res!221091) (not e!234688))))

(assert (=> b!387024 (= res!221091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387025 () Bool)

(declare-fun res!221089 () Bool)

(assert (=> b!387025 (=> (not res!221089) (not e!234688))))

(assert (=> b!387025 (= res!221089 (or (= (select (arr!10921 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10921 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387026 () Bool)

(declare-fun res!221090 () Bool)

(assert (=> b!387026 (=> (not res!221090) (not e!234688))))

(assert (=> b!387026 (= res!221090 (and (= (size!11274 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11273 _keys!658) (size!11274 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387027 () Bool)

(declare-fun res!221086 () Bool)

(assert (=> b!387027 (=> (not res!221086) (not e!234688))))

(assert (=> b!387027 (= res!221086 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6162))))

(declare-fun b!387028 () Bool)

(assert (=> b!387028 (= e!234687 tp_is_empty!9511)))

(declare-fun b!387019 () Bool)

(declare-fun res!221088 () Bool)

(assert (=> b!387019 (=> (not res!221088) (not e!234688))))

(assert (=> b!387019 (= res!221088 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11273 _keys!658))))))

(declare-fun res!221085 () Bool)

(assert (=> start!37722 (=> (not res!221085) (not e!234688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37722 (= res!221085 (validMask!0 mask!970))))

(assert (=> start!37722 e!234688))

(declare-fun array_inv!8072 (array!22908) Bool)

(assert (=> start!37722 (and (array_inv!8072 _values!506) e!234685)))

(assert (=> start!37722 tp!31269))

(assert (=> start!37722 true))

(assert (=> start!37722 tp_is_empty!9511))

(declare-fun array_inv!8073 (array!22906) Bool)

(assert (=> start!37722 (array_inv!8073 _keys!658)))

(assert (= (and start!37722 res!221085) b!387026))

(assert (= (and b!387026 res!221090) b!387024))

(assert (= (and b!387024 res!221091) b!387027))

(assert (= (and b!387027 res!221086) b!387019))

(assert (= (and b!387019 res!221088) b!387020))

(assert (= (and b!387020 res!221093) b!387025))

(assert (= (and b!387025 res!221089) b!387016))

(assert (= (and b!387016 res!221092) b!387022))

(assert (= (and b!387022 res!221087) b!387018))

(assert (= (and b!387018 res!221084) b!387023))

(assert (= (and b!387021 condMapEmpty!15831) mapIsEmpty!15831))

(assert (= (and b!387021 (not condMapEmpty!15831)) mapNonEmpty!15831))

(get-info :version)

(assert (= (and mapNonEmpty!15831 ((_ is ValueCellFull!4412) mapValue!15831)) b!387017))

(assert (= (and b!387021 ((_ is ValueCellFull!4412) mapDefault!15831)) b!387028))

(assert (= start!37722 b!387021))

(declare-fun m!383495 () Bool)

(assert (=> mapNonEmpty!15831 m!383495))

(declare-fun m!383497 () Bool)

(assert (=> b!387016 m!383497))

(declare-fun m!383499 () Bool)

(assert (=> b!387024 m!383499))

(declare-fun m!383501 () Bool)

(assert (=> b!387023 m!383501))

(declare-fun m!383503 () Bool)

(assert (=> b!387023 m!383503))

(declare-fun m!383505 () Bool)

(assert (=> b!387023 m!383505))

(declare-fun m!383507 () Bool)

(assert (=> start!37722 m!383507))

(declare-fun m!383509 () Bool)

(assert (=> start!37722 m!383509))

(declare-fun m!383511 () Bool)

(assert (=> start!37722 m!383511))

(declare-fun m!383513 () Bool)

(assert (=> b!387027 m!383513))

(declare-fun m!383515 () Bool)

(assert (=> b!387020 m!383515))

(declare-fun m!383517 () Bool)

(assert (=> b!387025 m!383517))

(declare-fun m!383519 () Bool)

(assert (=> b!387018 m!383519))

(declare-fun m!383521 () Bool)

(assert (=> b!387022 m!383521))

(declare-fun m!383523 () Bool)

(assert (=> b!387022 m!383523))

(check-sat (not b!387023) (not b!387027) tp_is_empty!9511 (not b!387016) (not b!387020) (not mapNonEmpty!15831) b_and!16095 (not b!387018) (not start!37722) (not b!387024) (not b!387022) (not b_next!8839))
(check-sat b_and!16095 (not b_next!8839))
