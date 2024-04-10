; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37650 () Bool)

(assert start!37650)

(declare-fun res!219886 () Bool)

(declare-fun e!233965 () Bool)

(assert (=> start!37650 (=> (not res!219886) (not e!233965))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37650 (= res!219886 (validMask!0 mask!970))))

(assert (=> start!37650 e!233965))

(assert (=> start!37650 true))

(declare-datatypes ((V!13671 0))(
  ( (V!13672 (val!4757 Int)) )
))
(declare-datatypes ((ValueCell!4369 0))(
  ( (ValueCellFull!4369 (v!6954 V!13671)) (EmptyCell!4369) )
))
(declare-datatypes ((array!22751 0))(
  ( (array!22752 (arr!10844 (Array (_ BitVec 32) ValueCell!4369)) (size!11196 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22751)

(declare-fun e!233962 () Bool)

(declare-fun array_inv!7982 (array!22751) Bool)

(assert (=> start!37650 (and (array_inv!7982 _values!506) e!233962)))

(declare-datatypes ((array!22753 0))(
  ( (array!22754 (arr!10845 (Array (_ BitVec 32) (_ BitVec 64))) (size!11197 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22753)

(declare-fun array_inv!7983 (array!22753) Bool)

(assert (=> start!37650 (array_inv!7983 _keys!658)))

(declare-fun b!385476 () Bool)

(declare-fun e!233966 () Bool)

(declare-fun tp_is_empty!9425 () Bool)

(assert (=> b!385476 (= e!233966 tp_is_empty!9425)))

(declare-fun mapIsEmpty!15702 () Bool)

(declare-fun mapRes!15702 () Bool)

(assert (=> mapIsEmpty!15702 mapRes!15702))

(declare-fun mapNonEmpty!15702 () Bool)

(declare-fun tp!31029 () Bool)

(assert (=> mapNonEmpty!15702 (= mapRes!15702 (and tp!31029 e!233966))))

(declare-fun mapRest!15702 () (Array (_ BitVec 32) ValueCell!4369))

(declare-fun mapKey!15702 () (_ BitVec 32))

(declare-fun mapValue!15702 () ValueCell!4369)

(assert (=> mapNonEmpty!15702 (= (arr!10844 _values!506) (store mapRest!15702 mapKey!15702 mapValue!15702))))

(declare-fun b!385477 () Bool)

(assert (=> b!385477 (= e!233965 false)))

(declare-fun lt!181620 () Bool)

(declare-datatypes ((List!6244 0))(
  ( (Nil!6241) (Cons!6240 (h!7096 (_ BitVec 64)) (t!11394 List!6244)) )
))
(declare-fun arrayNoDuplicates!0 (array!22753 (_ BitVec 32) List!6244) Bool)

(assert (=> b!385477 (= lt!181620 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6241))))

(declare-fun b!385478 () Bool)

(declare-fun e!233963 () Bool)

(assert (=> b!385478 (= e!233963 tp_is_empty!9425)))

(declare-fun b!385479 () Bool)

(declare-fun res!219885 () Bool)

(assert (=> b!385479 (=> (not res!219885) (not e!233965))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385479 (= res!219885 (and (= (size!11196 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11197 _keys!658) (size!11196 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385480 () Bool)

(declare-fun res!219887 () Bool)

(assert (=> b!385480 (=> (not res!219887) (not e!233965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22753 (_ BitVec 32)) Bool)

(assert (=> b!385480 (= res!219887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385481 () Bool)

(assert (=> b!385481 (= e!233962 (and e!233963 mapRes!15702))))

(declare-fun condMapEmpty!15702 () Bool)

(declare-fun mapDefault!15702 () ValueCell!4369)

