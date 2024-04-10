; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39144 () Bool)

(assert start!39144)

(declare-fun b_free!9411 () Bool)

(declare-fun b_next!9411 () Bool)

(assert (=> start!39144 (= b_free!9411 (not b_next!9411))))

(declare-fun tp!33762 () Bool)

(declare-fun b_and!16797 () Bool)

(assert (=> start!39144 (= tp!33762 b_and!16797)))

(declare-fun b!411852 () Bool)

(declare-fun e!246571 () Bool)

(declare-fun e!246572 () Bool)

(declare-fun mapRes!17466 () Bool)

(assert (=> b!411852 (= e!246571 (and e!246572 mapRes!17466))))

(declare-fun condMapEmpty!17466 () Bool)

(declare-datatypes ((V!15189 0))(
  ( (V!15190 (val!5326 Int)) )
))
(declare-datatypes ((ValueCell!4938 0))(
  ( (ValueCellFull!4938 (v!7573 V!15189)) (EmptyCell!4938) )
))
(declare-datatypes ((array!24987 0))(
  ( (array!24988 (arr!11943 (Array (_ BitVec 32) ValueCell!4938)) (size!12295 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24987)

(declare-fun mapDefault!17466 () ValueCell!4938)

(assert (=> b!411852 (= condMapEmpty!17466 (= (arr!11943 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4938)) mapDefault!17466)))))

(declare-fun b!411853 () Bool)

(declare-fun res!239026 () Bool)

(declare-fun e!246573 () Bool)

(assert (=> b!411853 (=> (not res!239026) (not e!246573))))

(declare-datatypes ((array!24989 0))(
  ( (array!24990 (arr!11944 (Array (_ BitVec 32) (_ BitVec 64))) (size!12296 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24989)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411853 (= res!239026 (or (= (select (arr!11944 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11944 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411854 () Bool)

(declare-fun e!246575 () Bool)

(assert (=> b!411854 (= e!246575 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15189)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun v!412 () V!15189)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15189)

(declare-fun lt!189364 () array!24989)

(declare-datatypes ((tuple2!6910 0))(
  ( (tuple2!6911 (_1!3466 (_ BitVec 64)) (_2!3466 V!15189)) )
))
(declare-datatypes ((List!6935 0))(
  ( (Nil!6932) (Cons!6931 (h!7787 tuple2!6910) (t!12109 List!6935)) )
))
(declare-datatypes ((ListLongMap!5823 0))(
  ( (ListLongMap!5824 (toList!2927 List!6935)) )
))
(declare-fun lt!189365 () ListLongMap!5823)

(declare-fun getCurrentListMapNoExtraKeys!1135 (array!24989 array!24987 (_ BitVec 32) (_ BitVec 32) V!15189 V!15189 (_ BitVec 32) Int) ListLongMap!5823)

(assert (=> b!411854 (= lt!189365 (getCurrentListMapNoExtraKeys!1135 lt!189364 (array!24988 (store (arr!11943 _values!549) i!563 (ValueCellFull!4938 v!412)) (size!12295 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189363 () ListLongMap!5823)

(assert (=> b!411854 (= lt!189363 (getCurrentListMapNoExtraKeys!1135 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411855 () Bool)

(declare-fun res!239028 () Bool)

(assert (=> b!411855 (=> (not res!239028) (not e!246575))))

(assert (=> b!411855 (= res!239028 (bvsle from!863 i!563))))

(declare-fun b!411856 () Bool)

(declare-fun res!239031 () Bool)

(assert (=> b!411856 (=> (not res!239031) (not e!246573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411856 (= res!239031 (validMask!0 mask!1025))))

(declare-fun res!239020 () Bool)

(assert (=> start!39144 (=> (not res!239020) (not e!246573))))

(assert (=> start!39144 (= res!239020 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12296 _keys!709))))))

(assert (=> start!39144 e!246573))

(declare-fun tp_is_empty!10563 () Bool)

(assert (=> start!39144 tp_is_empty!10563))

(assert (=> start!39144 tp!33762))

(assert (=> start!39144 true))

(declare-fun array_inv!8712 (array!24987) Bool)

(assert (=> start!39144 (and (array_inv!8712 _values!549) e!246571)))

(declare-fun array_inv!8713 (array!24989) Bool)

(assert (=> start!39144 (array_inv!8713 _keys!709)))

(declare-fun b!411857 () Bool)

(declare-fun e!246574 () Bool)

(assert (=> b!411857 (= e!246574 tp_is_empty!10563)))

(declare-fun b!411858 () Bool)

(declare-fun res!239024 () Bool)

(assert (=> b!411858 (=> (not res!239024) (not e!246573))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411858 (= res!239024 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17466 () Bool)

(declare-fun tp!33761 () Bool)

(assert (=> mapNonEmpty!17466 (= mapRes!17466 (and tp!33761 e!246574))))

(declare-fun mapRest!17466 () (Array (_ BitVec 32) ValueCell!4938))

(declare-fun mapKey!17466 () (_ BitVec 32))

(declare-fun mapValue!17466 () ValueCell!4938)

(assert (=> mapNonEmpty!17466 (= (arr!11943 _values!549) (store mapRest!17466 mapKey!17466 mapValue!17466))))

(declare-fun mapIsEmpty!17466 () Bool)

(assert (=> mapIsEmpty!17466 mapRes!17466))

(declare-fun b!411859 () Bool)

(assert (=> b!411859 (= e!246572 tp_is_empty!10563)))

(declare-fun b!411860 () Bool)

(declare-fun res!239025 () Bool)

(assert (=> b!411860 (=> (not res!239025) (not e!246575))))

(declare-datatypes ((List!6936 0))(
  ( (Nil!6933) (Cons!6932 (h!7788 (_ BitVec 64)) (t!12110 List!6936)) )
))
(declare-fun arrayNoDuplicates!0 (array!24989 (_ BitVec 32) List!6936) Bool)

(assert (=> b!411860 (= res!239025 (arrayNoDuplicates!0 lt!189364 #b00000000000000000000000000000000 Nil!6933))))

(declare-fun b!411861 () Bool)

(assert (=> b!411861 (= e!246573 e!246575)))

(declare-fun res!239030 () Bool)

(assert (=> b!411861 (=> (not res!239030) (not e!246575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24989 (_ BitVec 32)) Bool)

(assert (=> b!411861 (= res!239030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189364 mask!1025))))

(assert (=> b!411861 (= lt!189364 (array!24990 (store (arr!11944 _keys!709) i!563 k0!794) (size!12296 _keys!709)))))

(declare-fun b!411862 () Bool)

(declare-fun res!239027 () Bool)

(assert (=> b!411862 (=> (not res!239027) (not e!246573))))

(assert (=> b!411862 (= res!239027 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6933))))

(declare-fun b!411863 () Bool)

(declare-fun res!239022 () Bool)

(assert (=> b!411863 (=> (not res!239022) (not e!246573))))

(assert (=> b!411863 (= res!239022 (and (= (size!12295 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12296 _keys!709) (size!12295 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411864 () Bool)

(declare-fun res!239029 () Bool)

(assert (=> b!411864 (=> (not res!239029) (not e!246573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411864 (= res!239029 (validKeyInArray!0 k0!794))))

(declare-fun b!411865 () Bool)

(declare-fun res!239023 () Bool)

(assert (=> b!411865 (=> (not res!239023) (not e!246573))))

(assert (=> b!411865 (= res!239023 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12296 _keys!709))))))

(declare-fun b!411866 () Bool)

(declare-fun res!239021 () Bool)

(assert (=> b!411866 (=> (not res!239021) (not e!246573))))

(assert (=> b!411866 (= res!239021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39144 res!239020) b!411856))

(assert (= (and b!411856 res!239031) b!411863))

(assert (= (and b!411863 res!239022) b!411866))

(assert (= (and b!411866 res!239021) b!411862))

(assert (= (and b!411862 res!239027) b!411865))

(assert (= (and b!411865 res!239023) b!411864))

(assert (= (and b!411864 res!239029) b!411853))

(assert (= (and b!411853 res!239026) b!411858))

(assert (= (and b!411858 res!239024) b!411861))

(assert (= (and b!411861 res!239030) b!411860))

(assert (= (and b!411860 res!239025) b!411855))

(assert (= (and b!411855 res!239028) b!411854))

(assert (= (and b!411852 condMapEmpty!17466) mapIsEmpty!17466))

(assert (= (and b!411852 (not condMapEmpty!17466)) mapNonEmpty!17466))

(get-info :version)

(assert (= (and mapNonEmpty!17466 ((_ is ValueCellFull!4938) mapValue!17466)) b!411857))

(assert (= (and b!411852 ((_ is ValueCellFull!4938) mapDefault!17466)) b!411859))

(assert (= start!39144 b!411852))

(declare-fun m!401863 () Bool)

(assert (=> b!411860 m!401863))

(declare-fun m!401865 () Bool)

(assert (=> b!411862 m!401865))

(declare-fun m!401867 () Bool)

(assert (=> b!411854 m!401867))

(declare-fun m!401869 () Bool)

(assert (=> b!411854 m!401869))

(declare-fun m!401871 () Bool)

(assert (=> b!411854 m!401871))

(declare-fun m!401873 () Bool)

(assert (=> b!411861 m!401873))

(declare-fun m!401875 () Bool)

(assert (=> b!411861 m!401875))

(declare-fun m!401877 () Bool)

(assert (=> b!411856 m!401877))

(declare-fun m!401879 () Bool)

(assert (=> start!39144 m!401879))

(declare-fun m!401881 () Bool)

(assert (=> start!39144 m!401881))

(declare-fun m!401883 () Bool)

(assert (=> b!411858 m!401883))

(declare-fun m!401885 () Bool)

(assert (=> b!411853 m!401885))

(declare-fun m!401887 () Bool)

(assert (=> b!411864 m!401887))

(declare-fun m!401889 () Bool)

(assert (=> mapNonEmpty!17466 m!401889))

(declare-fun m!401891 () Bool)

(assert (=> b!411866 m!401891))

(check-sat (not b!411864) (not start!39144) (not b!411862) (not b!411860) (not b_next!9411) (not b!411858) (not b!411854) b_and!16797 (not b!411856) tp_is_empty!10563 (not mapNonEmpty!17466) (not b!411866) (not b!411861))
(check-sat b_and!16797 (not b_next!9411))
