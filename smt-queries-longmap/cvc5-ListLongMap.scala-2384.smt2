; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37766 () Bool)

(assert start!37766)

(declare-fun b_free!8869 () Bool)

(declare-fun b_next!8869 () Bool)

(assert (=> start!37766 (= b_free!8869 (not b_next!8869))))

(declare-fun tp!31359 () Bool)

(declare-fun b_and!16111 () Bool)

(assert (=> start!37766 (= tp!31359 b_and!16111)))

(declare-fun b!387650 () Bool)

(declare-fun res!221537 () Bool)

(declare-fun e!234990 () Bool)

(assert (=> b!387650 (=> (not res!221537) (not e!234990))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13827 0))(
  ( (V!13828 (val!4815 Int)) )
))
(declare-datatypes ((ValueCell!4427 0))(
  ( (ValueCellFull!4427 (v!7012 V!13827)) (EmptyCell!4427) )
))
(declare-datatypes ((array!22973 0))(
  ( (array!22974 (arr!10955 (Array (_ BitVec 32) ValueCell!4427)) (size!11307 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22973)

(declare-datatypes ((array!22975 0))(
  ( (array!22976 (arr!10956 (Array (_ BitVec 32) (_ BitVec 64))) (size!11308 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22975)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387650 (= res!221537 (and (= (size!11307 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11308 _keys!658) (size!11307 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15876 () Bool)

(declare-fun mapRes!15876 () Bool)

(declare-fun tp!31358 () Bool)

(declare-fun e!234989 () Bool)

(assert (=> mapNonEmpty!15876 (= mapRes!15876 (and tp!31358 e!234989))))

(declare-fun mapRest!15876 () (Array (_ BitVec 32) ValueCell!4427))

(declare-fun mapKey!15876 () (_ BitVec 32))

(declare-fun mapValue!15876 () ValueCell!4427)

(assert (=> mapNonEmpty!15876 (= (arr!10955 _values!506) (store mapRest!15876 mapKey!15876 mapValue!15876))))

(declare-fun b!387651 () Bool)

(declare-fun tp_is_empty!9541 () Bool)

(assert (=> b!387651 (= e!234989 tp_is_empty!9541)))

(declare-fun mapIsEmpty!15876 () Bool)

(assert (=> mapIsEmpty!15876 mapRes!15876))

(declare-fun res!221543 () Bool)

(assert (=> start!37766 (=> (not res!221543) (not e!234990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37766 (= res!221543 (validMask!0 mask!970))))

(assert (=> start!37766 e!234990))

(declare-fun e!234988 () Bool)

(declare-fun array_inv!8058 (array!22973) Bool)

(assert (=> start!37766 (and (array_inv!8058 _values!506) e!234988)))

(assert (=> start!37766 tp!31359))

(assert (=> start!37766 true))

(assert (=> start!37766 tp_is_empty!9541))

(declare-fun array_inv!8059 (array!22975) Bool)

(assert (=> start!37766 (array_inv!8059 _keys!658)))

(declare-fun b!387652 () Bool)

(declare-fun res!221538 () Bool)

(assert (=> b!387652 (=> (not res!221538) (not e!234990))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387652 (= res!221538 (or (= (select (arr!10956 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10956 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387653 () Bool)

(declare-fun res!221541 () Bool)

(assert (=> b!387653 (=> (not res!221541) (not e!234990))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387653 (= res!221541 (validKeyInArray!0 k!778))))

(declare-fun b!387654 () Bool)

(declare-fun e!234987 () Bool)

(assert (=> b!387654 (= e!234990 e!234987)))

(declare-fun res!221545 () Bool)

(assert (=> b!387654 (=> (not res!221545) (not e!234987))))

(declare-fun lt!182088 () array!22975)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22975 (_ BitVec 32)) Bool)

(assert (=> b!387654 (= res!221545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182088 mask!970))))

(assert (=> b!387654 (= lt!182088 (array!22976 (store (arr!10956 _keys!658) i!548 k!778) (size!11308 _keys!658)))))

(declare-fun b!387655 () Bool)

(declare-fun e!234991 () Bool)

(assert (=> b!387655 (= e!234988 (and e!234991 mapRes!15876))))

(declare-fun condMapEmpty!15876 () Bool)

(declare-fun mapDefault!15876 () ValueCell!4427)

