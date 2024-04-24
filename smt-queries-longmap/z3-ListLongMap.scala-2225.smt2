; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36798 () Bool)

(assert start!36798)

(declare-fun b_free!7939 () Bool)

(declare-fun b_next!7939 () Bool)

(assert (=> start!36798 (= b_free!7939 (not b_next!7939))))

(declare-fun tp!28532 () Bool)

(declare-fun b_and!15195 () Bool)

(assert (=> start!36798 (= tp!28532 b_and!15195)))

(declare-fun b!367801 () Bool)

(declare-fun e!225031 () Bool)

(declare-fun tp_is_empty!8587 () Bool)

(assert (=> b!367801 (= e!225031 tp_is_empty!8587)))

(declare-fun b!367802 () Bool)

(declare-fun e!225030 () Bool)

(declare-fun e!225033 () Bool)

(assert (=> b!367802 (= e!225030 e!225033)))

(declare-fun res!206032 () Bool)

(assert (=> b!367802 (=> (not res!206032) (not e!225033))))

(declare-datatypes ((array!21114 0))(
  ( (array!21115 (arr!10025 (Array (_ BitVec 32) (_ BitVec 64))) (size!10377 (_ BitVec 32))) )
))
(declare-fun lt!169458 () array!21114)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21114 (_ BitVec 32)) Bool)

(assert (=> b!367802 (= res!206032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169458 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21114)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367802 (= lt!169458 (array!21115 (store (arr!10025 _keys!658) i!548 k0!778) (size!10377 _keys!658)))))

(declare-fun b!367803 () Bool)

(declare-fun res!206036 () Bool)

(assert (=> b!367803 (=> (not res!206036) (not e!225030))))

(declare-datatypes ((List!5486 0))(
  ( (Nil!5483) (Cons!5482 (h!6338 (_ BitVec 64)) (t!10628 List!5486)) )
))
(declare-fun arrayNoDuplicates!0 (array!21114 (_ BitVec 32) List!5486) Bool)

(assert (=> b!367803 (= res!206036 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5483))))

(declare-fun res!206029 () Bool)

(assert (=> start!36798 (=> (not res!206029) (not e!225030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36798 (= res!206029 (validMask!0 mask!970))))

(assert (=> start!36798 e!225030))

(assert (=> start!36798 true))

(declare-datatypes ((V!12555 0))(
  ( (V!12556 (val!4338 Int)) )
))
(declare-datatypes ((ValueCell!3950 0))(
  ( (ValueCellFull!3950 (v!6536 V!12555)) (EmptyCell!3950) )
))
(declare-datatypes ((array!21116 0))(
  ( (array!21117 (arr!10026 (Array (_ BitVec 32) ValueCell!3950)) (size!10378 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21116)

(declare-fun e!225028 () Bool)

(declare-fun array_inv!7444 (array!21116) Bool)

(assert (=> start!36798 (and (array_inv!7444 _values!506) e!225028)))

(assert (=> start!36798 tp!28532))

(assert (=> start!36798 tp_is_empty!8587))

(declare-fun array_inv!7445 (array!21114) Bool)

(assert (=> start!36798 (array_inv!7445 _keys!658)))

(declare-fun b!367804 () Bool)

(declare-fun res!206027 () Bool)

(assert (=> b!367804 (=> (not res!206027) (not e!225030))))

(assert (=> b!367804 (= res!206027 (or (= (select (arr!10025 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10025 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14445 () Bool)

(declare-fun mapRes!14445 () Bool)

(assert (=> mapIsEmpty!14445 mapRes!14445))

(declare-fun b!367805 () Bool)

(declare-fun e!225029 () Bool)

(assert (=> b!367805 (= e!225028 (and e!225029 mapRes!14445))))

(declare-fun condMapEmpty!14445 () Bool)

(declare-fun mapDefault!14445 () ValueCell!3950)

(assert (=> b!367805 (= condMapEmpty!14445 (= (arr!10026 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3950)) mapDefault!14445)))))

(declare-fun b!367806 () Bool)

(declare-fun res!206035 () Bool)

(assert (=> b!367806 (=> (not res!206035) (not e!225030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367806 (= res!206035 (validKeyInArray!0 k0!778))))

(declare-fun b!367807 () Bool)

(declare-fun res!206028 () Bool)

(assert (=> b!367807 (=> (not res!206028) (not e!225030))))

(assert (=> b!367807 (= res!206028 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10377 _keys!658))))))

(declare-fun b!367808 () Bool)

(declare-fun res!206033 () Bool)

(assert (=> b!367808 (=> (not res!206033) (not e!225030))))

(assert (=> b!367808 (= res!206033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367809 () Bool)

(declare-fun res!206034 () Bool)

(assert (=> b!367809 (=> (not res!206034) (not e!225030))))

(declare-fun arrayContainsKey!0 (array!21114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367809 (= res!206034 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367810 () Bool)

(declare-fun res!206030 () Bool)

(assert (=> b!367810 (=> (not res!206030) (not e!225030))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367810 (= res!206030 (and (= (size!10378 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10377 _keys!658) (size!10378 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367811 () Bool)

(assert (=> b!367811 (= e!225033 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5668 0))(
  ( (tuple2!5669 (_1!2845 (_ BitVec 64)) (_2!2845 V!12555)) )
))
(declare-datatypes ((List!5487 0))(
  ( (Nil!5484) (Cons!5483 (h!6339 tuple2!5668) (t!10629 List!5487)) )
))
(declare-datatypes ((ListLongMap!4583 0))(
  ( (ListLongMap!4584 (toList!2307 List!5487)) )
))
(declare-fun lt!169459 () ListLongMap!4583)

(declare-fun zeroValue!472 () V!12555)

(declare-fun minValue!472 () V!12555)

(declare-fun getCurrentListMapNoExtraKeys!616 (array!21114 array!21116 (_ BitVec 32) (_ BitVec 32) V!12555 V!12555 (_ BitVec 32) Int) ListLongMap!4583)

(assert (=> b!367811 (= lt!169459 (getCurrentListMapNoExtraKeys!616 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14445 () Bool)

(declare-fun tp!28533 () Bool)

(assert (=> mapNonEmpty!14445 (= mapRes!14445 (and tp!28533 e!225031))))

(declare-fun mapValue!14445 () ValueCell!3950)

(declare-fun mapKey!14445 () (_ BitVec 32))

(declare-fun mapRest!14445 () (Array (_ BitVec 32) ValueCell!3950))

(assert (=> mapNonEmpty!14445 (= (arr!10026 _values!506) (store mapRest!14445 mapKey!14445 mapValue!14445))))

(declare-fun b!367812 () Bool)

(assert (=> b!367812 (= e!225029 tp_is_empty!8587)))

(declare-fun b!367813 () Bool)

(declare-fun res!206031 () Bool)

(assert (=> b!367813 (=> (not res!206031) (not e!225033))))

(assert (=> b!367813 (= res!206031 (arrayNoDuplicates!0 lt!169458 #b00000000000000000000000000000000 Nil!5483))))

(assert (= (and start!36798 res!206029) b!367810))

(assert (= (and b!367810 res!206030) b!367808))

(assert (= (and b!367808 res!206033) b!367803))

(assert (= (and b!367803 res!206036) b!367807))

(assert (= (and b!367807 res!206028) b!367806))

(assert (= (and b!367806 res!206035) b!367804))

(assert (= (and b!367804 res!206027) b!367809))

(assert (= (and b!367809 res!206034) b!367802))

(assert (= (and b!367802 res!206032) b!367813))

(assert (= (and b!367813 res!206031) b!367811))

(assert (= (and b!367805 condMapEmpty!14445) mapIsEmpty!14445))

(assert (= (and b!367805 (not condMapEmpty!14445)) mapNonEmpty!14445))

(get-info :version)

(assert (= (and mapNonEmpty!14445 ((_ is ValueCellFull!3950) mapValue!14445)) b!367801))

(assert (= (and b!367805 ((_ is ValueCellFull!3950) mapDefault!14445)) b!367812))

(assert (= start!36798 b!367805))

(declare-fun m!364919 () Bool)

(assert (=> b!367802 m!364919))

(declare-fun m!364921 () Bool)

(assert (=> b!367802 m!364921))

(declare-fun m!364923 () Bool)

(assert (=> start!36798 m!364923))

(declare-fun m!364925 () Bool)

(assert (=> start!36798 m!364925))

(declare-fun m!364927 () Bool)

(assert (=> start!36798 m!364927))

(declare-fun m!364929 () Bool)

(assert (=> b!367808 m!364929))

(declare-fun m!364931 () Bool)

(assert (=> b!367809 m!364931))

(declare-fun m!364933 () Bool)

(assert (=> b!367804 m!364933))

(declare-fun m!364935 () Bool)

(assert (=> b!367803 m!364935))

(declare-fun m!364937 () Bool)

(assert (=> b!367806 m!364937))

(declare-fun m!364939 () Bool)

(assert (=> b!367811 m!364939))

(declare-fun m!364941 () Bool)

(assert (=> mapNonEmpty!14445 m!364941))

(declare-fun m!364943 () Bool)

(assert (=> b!367813 m!364943))

(check-sat (not start!36798) (not b!367811) (not b_next!7939) (not b!367813) (not b!367803) b_and!15195 (not b!367802) (not b!367806) tp_is_empty!8587 (not mapNonEmpty!14445) (not b!367808) (not b!367809))
(check-sat b_and!15195 (not b_next!7939))
