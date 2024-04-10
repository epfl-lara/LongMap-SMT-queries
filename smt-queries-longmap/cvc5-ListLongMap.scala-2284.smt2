; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37166 () Bool)

(assert start!37166)

(declare-fun b_free!8293 () Bool)

(declare-fun b_next!8293 () Bool)

(assert (=> start!37166 (= b_free!8293 (not b_next!8293))))

(declare-fun tp!29594 () Bool)

(declare-fun b_and!15535 () Bool)

(assert (=> start!37166 (= tp!29594 b_and!15535)))

(declare-fun b!375027 () Bool)

(declare-fun e!228516 () Bool)

(declare-fun tp_is_empty!8941 () Bool)

(assert (=> b!375027 (= e!228516 tp_is_empty!8941)))

(declare-fun b!375028 () Bool)

(declare-fun res!211622 () Bool)

(declare-fun e!228512 () Bool)

(assert (=> b!375028 (=> (not res!211622) (not e!228512))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21819 0))(
  ( (array!21820 (arr!10378 (Array (_ BitVec 32) (_ BitVec 64))) (size!10730 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21819)

(assert (=> b!375028 (= res!211622 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10730 _keys!658))))))

(declare-fun b!375029 () Bool)

(declare-fun res!211615 () Bool)

(assert (=> b!375029 (=> (not res!211615) (not e!228512))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375029 (= res!211615 (validKeyInArray!0 k!778))))

(declare-fun res!211620 () Bool)

(assert (=> start!37166 (=> (not res!211620) (not e!228512))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37166 (= res!211620 (validMask!0 mask!970))))

(assert (=> start!37166 e!228512))

(declare-datatypes ((V!13027 0))(
  ( (V!13028 (val!4515 Int)) )
))
(declare-datatypes ((ValueCell!4127 0))(
  ( (ValueCellFull!4127 (v!6712 V!13027)) (EmptyCell!4127) )
))
(declare-datatypes ((array!21821 0))(
  ( (array!21822 (arr!10379 (Array (_ BitVec 32) ValueCell!4127)) (size!10731 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21821)

(declare-fun e!228511 () Bool)

(declare-fun array_inv!7652 (array!21821) Bool)

(assert (=> start!37166 (and (array_inv!7652 _values!506) e!228511)))

(assert (=> start!37166 tp!29594))

(assert (=> start!37166 true))

(assert (=> start!37166 tp_is_empty!8941))

(declare-fun array_inv!7653 (array!21819) Bool)

(assert (=> start!37166 (array_inv!7653 _keys!658)))

(declare-fun b!375030 () Bool)

(declare-fun res!211617 () Bool)

(assert (=> b!375030 (=> (not res!211617) (not e!228512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21819 (_ BitVec 32)) Bool)

(assert (=> b!375030 (= res!211617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375031 () Bool)

(declare-fun e!228517 () Bool)

(assert (=> b!375031 (= e!228517 true)))

(declare-datatypes ((tuple2!6006 0))(
  ( (tuple2!6007 (_1!3014 (_ BitVec 64)) (_2!3014 V!13027)) )
))
(declare-fun lt!173279 () tuple2!6006)

(declare-datatypes ((List!5850 0))(
  ( (Nil!5847) (Cons!5846 (h!6702 tuple2!6006) (t!11000 List!5850)) )
))
(declare-datatypes ((ListLongMap!4919 0))(
  ( (ListLongMap!4920 (toList!2475 List!5850)) )
))
(declare-fun lt!173284 () ListLongMap!4919)

(declare-fun lt!173290 () ListLongMap!4919)

(declare-fun lt!173288 () tuple2!6006)

(declare-fun +!821 (ListLongMap!4919 tuple2!6006) ListLongMap!4919)

(assert (=> b!375031 (= (+!821 lt!173284 lt!173279) (+!821 lt!173290 lt!173288))))

(declare-fun v!373 () V!13027)

(declare-fun lt!173277 () ListLongMap!4919)

(declare-datatypes ((Unit!11548 0))(
  ( (Unit!11549) )
))
(declare-fun lt!173283 () Unit!11548)

(declare-fun minValue!472 () V!13027)

(declare-fun addCommutativeForDiffKeys!242 (ListLongMap!4919 (_ BitVec 64) V!13027 (_ BitVec 64) V!13027) Unit!11548)

(assert (=> b!375031 (= lt!173283 (addCommutativeForDiffKeys!242 lt!173277 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375032 () Bool)

(declare-fun res!211614 () Bool)

(assert (=> b!375032 (=> (not res!211614) (not e!228512))))

(assert (=> b!375032 (= res!211614 (or (= (select (arr!10378 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10378 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375033 () Bool)

(declare-fun res!211621 () Bool)

(assert (=> b!375033 (=> (not res!211621) (not e!228512))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375033 (= res!211621 (and (= (size!10731 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10730 _keys!658) (size!10731 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375034 () Bool)

(declare-fun res!211619 () Bool)

(assert (=> b!375034 (=> (not res!211619) (not e!228512))))

(declare-fun arrayContainsKey!0 (array!21819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375034 (= res!211619 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!375035 () Bool)

(declare-fun e!228518 () Bool)

(declare-fun mapRes!14976 () Bool)

(assert (=> b!375035 (= e!228511 (and e!228518 mapRes!14976))))

(declare-fun condMapEmpty!14976 () Bool)

(declare-fun mapDefault!14976 () ValueCell!4127)

