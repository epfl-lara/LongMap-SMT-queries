; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40538 () Bool)

(assert start!40538)

(declare-fun b!446783 () Bool)

(declare-fun res!265248 () Bool)

(declare-fun e!262435 () Bool)

(assert (=> b!446783 (=> (not res!265248) (not e!262435))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446783 (= res!265248 (validMask!0 mask!1025))))

(declare-fun res!265250 () Bool)

(assert (=> start!40538 (=> (not res!265250) (not e!262435))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27611 0))(
  ( (array!27612 (arr!13252 (Array (_ BitVec 32) (_ BitVec 64))) (size!13604 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27611)

(assert (=> start!40538 (= res!265250 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13604 _keys!709))))))

(assert (=> start!40538 e!262435))

(assert (=> start!40538 true))

(declare-datatypes ((V!16975 0))(
  ( (V!16976 (val!5996 Int)) )
))
(declare-datatypes ((ValueCell!5608 0))(
  ( (ValueCellFull!5608 (v!8251 V!16975)) (EmptyCell!5608) )
))
(declare-datatypes ((array!27613 0))(
  ( (array!27614 (arr!13253 (Array (_ BitVec 32) ValueCell!5608)) (size!13605 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27613)

(declare-fun e!262438 () Bool)

(declare-fun array_inv!9610 (array!27613) Bool)

(assert (=> start!40538 (and (array_inv!9610 _values!549) e!262438)))

(declare-fun array_inv!9611 (array!27611) Bool)

(assert (=> start!40538 (array_inv!9611 _keys!709)))

(declare-fun b!446784 () Bool)

(declare-fun res!265253 () Bool)

(assert (=> b!446784 (=> (not res!265253) (not e!262435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27611 (_ BitVec 32)) Bool)

(assert (=> b!446784 (= res!265253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19485 () Bool)

(declare-fun mapRes!19485 () Bool)

(declare-fun tp!37512 () Bool)

(declare-fun e!262436 () Bool)

(assert (=> mapNonEmpty!19485 (= mapRes!19485 (and tp!37512 e!262436))))

(declare-fun mapValue!19485 () ValueCell!5608)

(declare-fun mapKey!19485 () (_ BitVec 32))

(declare-fun mapRest!19485 () (Array (_ BitVec 32) ValueCell!5608))

(assert (=> mapNonEmpty!19485 (= (arr!13253 _values!549) (store mapRest!19485 mapKey!19485 mapValue!19485))))

(declare-fun b!446785 () Bool)

(declare-fun res!265255 () Bool)

(assert (=> b!446785 (=> (not res!265255) (not e!262435))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446785 (= res!265255 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!446786 () Bool)

(declare-fun res!265249 () Bool)

(assert (=> b!446786 (=> (not res!265249) (not e!262435))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446786 (= res!265249 (or (= (select (arr!13252 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13252 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446787 () Bool)

(declare-fun e!262440 () Bool)

(declare-fun tp_is_empty!11903 () Bool)

(assert (=> b!446787 (= e!262440 tp_is_empty!11903)))

(declare-fun b!446788 () Bool)

(declare-fun e!262439 () Bool)

(assert (=> b!446788 (= e!262435 e!262439)))

(declare-fun res!265254 () Bool)

(assert (=> b!446788 (=> (not res!265254) (not e!262439))))

(declare-fun lt!203852 () array!27611)

(assert (=> b!446788 (= res!265254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203852 mask!1025))))

(assert (=> b!446788 (= lt!203852 (array!27612 (store (arr!13252 _keys!709) i!563 k!794) (size!13604 _keys!709)))))

(declare-fun b!446789 () Bool)

(declare-fun res!265251 () Bool)

(assert (=> b!446789 (=> (not res!265251) (not e!262435))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446789 (= res!265251 (and (= (size!13605 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13604 _keys!709) (size!13605 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446790 () Bool)

(declare-fun res!265257 () Bool)

(assert (=> b!446790 (=> (not res!265257) (not e!262435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446790 (= res!265257 (validKeyInArray!0 k!794))))

(declare-fun b!446791 () Bool)

(declare-fun res!265252 () Bool)

(assert (=> b!446791 (=> (not res!265252) (not e!262439))))

(declare-datatypes ((List!7926 0))(
  ( (Nil!7923) (Cons!7922 (h!8778 (_ BitVec 64)) (t!13686 List!7926)) )
))
(declare-fun arrayNoDuplicates!0 (array!27611 (_ BitVec 32) List!7926) Bool)

(assert (=> b!446791 (= res!265252 (arrayNoDuplicates!0 lt!203852 #b00000000000000000000000000000000 Nil!7923))))

(declare-fun b!446792 () Bool)

(declare-fun res!265247 () Bool)

(assert (=> b!446792 (=> (not res!265247) (not e!262435))))

(assert (=> b!446792 (= res!265247 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7923))))

(declare-fun b!446793 () Bool)

(declare-fun res!265256 () Bool)

(assert (=> b!446793 (=> (not res!265256) (not e!262435))))

(assert (=> b!446793 (= res!265256 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13604 _keys!709))))))

(declare-fun mapIsEmpty!19485 () Bool)

(assert (=> mapIsEmpty!19485 mapRes!19485))

(declare-fun b!446794 () Bool)

(assert (=> b!446794 (= e!262439 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13604 _keys!709)) (bvsge i!563 (size!13605 _values!549))))))

(declare-fun b!446795 () Bool)

(assert (=> b!446795 (= e!262436 tp_is_empty!11903)))

(declare-fun b!446796 () Bool)

(assert (=> b!446796 (= e!262438 (and e!262440 mapRes!19485))))

(declare-fun condMapEmpty!19485 () Bool)

(declare-fun mapDefault!19485 () ValueCell!5608)

