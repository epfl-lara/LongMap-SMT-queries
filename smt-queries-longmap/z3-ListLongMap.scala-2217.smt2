; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36766 () Bool)

(assert start!36766)

(declare-fun b!367002 () Bool)

(declare-fun res!205395 () Bool)

(declare-fun e!224650 () Bool)

(assert (=> b!367002 (=> (not res!205395) (not e!224650))))

(declare-datatypes ((array!21041 0))(
  ( (array!21042 (arr!9989 (Array (_ BitVec 32) (_ BitVec 64))) (size!10341 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21041)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21041 (_ BitVec 32)) Bool)

(assert (=> b!367002 (= res!205395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367003 () Bool)

(declare-fun e!224649 () Bool)

(assert (=> b!367003 (= e!224650 e!224649)))

(declare-fun res!205391 () Bool)

(assert (=> b!367003 (=> (not res!205391) (not e!224649))))

(declare-fun lt!169311 () array!21041)

(assert (=> b!367003 (= res!205391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169311 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367003 (= lt!169311 (array!21042 (store (arr!9989 _keys!658) i!548 k0!778) (size!10341 _keys!658)))))

(declare-fun b!367004 () Bool)

(declare-fun e!224648 () Bool)

(declare-fun tp_is_empty!8541 () Bool)

(assert (=> b!367004 (= e!224648 tp_is_empty!8541)))

(declare-fun res!205389 () Bool)

(assert (=> start!36766 (=> (not res!205389) (not e!224650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36766 (= res!205389 (validMask!0 mask!970))))

(assert (=> start!36766 e!224650))

(assert (=> start!36766 true))

(declare-datatypes ((V!12493 0))(
  ( (V!12494 (val!4315 Int)) )
))
(declare-datatypes ((ValueCell!3927 0))(
  ( (ValueCellFull!3927 (v!6512 V!12493)) (EmptyCell!3927) )
))
(declare-datatypes ((array!21043 0))(
  ( (array!21044 (arr!9990 (Array (_ BitVec 32) ValueCell!3927)) (size!10342 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21043)

(declare-fun e!224651 () Bool)

(declare-fun array_inv!7388 (array!21043) Bool)

(assert (=> start!36766 (and (array_inv!7388 _values!506) e!224651)))

(declare-fun array_inv!7389 (array!21041) Bool)

(assert (=> start!36766 (array_inv!7389 _keys!658)))

(declare-fun b!367005 () Bool)

(declare-fun res!205397 () Bool)

(assert (=> b!367005 (=> (not res!205397) (not e!224650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367005 (= res!205397 (validKeyInArray!0 k0!778))))

(declare-fun b!367006 () Bool)

(declare-fun res!205394 () Bool)

(assert (=> b!367006 (=> (not res!205394) (not e!224650))))

(declare-datatypes ((List!5558 0))(
  ( (Nil!5555) (Cons!5554 (h!6410 (_ BitVec 64)) (t!10708 List!5558)) )
))
(declare-fun arrayNoDuplicates!0 (array!21041 (_ BitVec 32) List!5558) Bool)

(assert (=> b!367006 (= res!205394 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5555))))

(declare-fun b!367007 () Bool)

(declare-fun res!205393 () Bool)

(assert (=> b!367007 (=> (not res!205393) (not e!224650))))

(assert (=> b!367007 (= res!205393 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10341 _keys!658))))))

(declare-fun b!367008 () Bool)

(declare-fun e!224646 () Bool)

(declare-fun mapRes!14376 () Bool)

(assert (=> b!367008 (= e!224651 (and e!224646 mapRes!14376))))

(declare-fun condMapEmpty!14376 () Bool)

(declare-fun mapDefault!14376 () ValueCell!3927)

(assert (=> b!367008 (= condMapEmpty!14376 (= (arr!9990 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3927)) mapDefault!14376)))))

(declare-fun b!367009 () Bool)

(declare-fun res!205396 () Bool)

(assert (=> b!367009 (=> (not res!205396) (not e!224650))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367009 (= res!205396 (and (= (size!10342 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10341 _keys!658) (size!10342 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367010 () Bool)

(declare-fun res!205392 () Bool)

(assert (=> b!367010 (=> (not res!205392) (not e!224650))))

(declare-fun arrayContainsKey!0 (array!21041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367010 (= res!205392 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367011 () Bool)

(declare-fun res!205390 () Bool)

(assert (=> b!367011 (=> (not res!205390) (not e!224650))))

(assert (=> b!367011 (= res!205390 (or (= (select (arr!9989 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9989 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367012 () Bool)

(assert (=> b!367012 (= e!224649 false)))

(declare-fun lt!169310 () Bool)

(assert (=> b!367012 (= lt!169310 (arrayNoDuplicates!0 lt!169311 #b00000000000000000000000000000000 Nil!5555))))

(declare-fun mapNonEmpty!14376 () Bool)

(declare-fun tp!28452 () Bool)

(assert (=> mapNonEmpty!14376 (= mapRes!14376 (and tp!28452 e!224648))))

(declare-fun mapRest!14376 () (Array (_ BitVec 32) ValueCell!3927))

(declare-fun mapValue!14376 () ValueCell!3927)

(declare-fun mapKey!14376 () (_ BitVec 32))

(assert (=> mapNonEmpty!14376 (= (arr!9990 _values!506) (store mapRest!14376 mapKey!14376 mapValue!14376))))

(declare-fun mapIsEmpty!14376 () Bool)

(assert (=> mapIsEmpty!14376 mapRes!14376))

(declare-fun b!367013 () Bool)

(assert (=> b!367013 (= e!224646 tp_is_empty!8541)))

(assert (= (and start!36766 res!205389) b!367009))

(assert (= (and b!367009 res!205396) b!367002))

(assert (= (and b!367002 res!205395) b!367006))

(assert (= (and b!367006 res!205394) b!367007))

(assert (= (and b!367007 res!205393) b!367005))

(assert (= (and b!367005 res!205397) b!367011))

(assert (= (and b!367011 res!205390) b!367010))

(assert (= (and b!367010 res!205392) b!367003))

(assert (= (and b!367003 res!205391) b!367012))

(assert (= (and b!367008 condMapEmpty!14376) mapIsEmpty!14376))

(assert (= (and b!367008 (not condMapEmpty!14376)) mapNonEmpty!14376))

(get-info :version)

(assert (= (and mapNonEmpty!14376 ((_ is ValueCellFull!3927) mapValue!14376)) b!367004))

(assert (= (and b!367008 ((_ is ValueCellFull!3927) mapDefault!14376)) b!367013))

(assert (= start!36766 b!367008))

(declare-fun m!364131 () Bool)

(assert (=> b!367002 m!364131))

(declare-fun m!364133 () Bool)

(assert (=> b!367011 m!364133))

(declare-fun m!364135 () Bool)

(assert (=> b!367005 m!364135))

(declare-fun m!364137 () Bool)

(assert (=> mapNonEmpty!14376 m!364137))

(declare-fun m!364139 () Bool)

(assert (=> start!36766 m!364139))

(declare-fun m!364141 () Bool)

(assert (=> start!36766 m!364141))

(declare-fun m!364143 () Bool)

(assert (=> start!36766 m!364143))

(declare-fun m!364145 () Bool)

(assert (=> b!367006 m!364145))

(declare-fun m!364147 () Bool)

(assert (=> b!367010 m!364147))

(declare-fun m!364149 () Bool)

(assert (=> b!367012 m!364149))

(declare-fun m!364151 () Bool)

(assert (=> b!367003 m!364151))

(declare-fun m!364153 () Bool)

(assert (=> b!367003 m!364153))

(check-sat (not b!367005) (not b!367003) (not mapNonEmpty!14376) (not start!36766) tp_is_empty!8541 (not b!367010) (not b!367012) (not b!367002) (not b!367006))
(check-sat)
