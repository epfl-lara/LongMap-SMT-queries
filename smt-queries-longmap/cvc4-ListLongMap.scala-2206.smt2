; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36642 () Bool)

(assert start!36642)

(declare-fun mapIsEmpty!14268 () Bool)

(declare-fun mapRes!14268 () Bool)

(assert (=> mapIsEmpty!14268 mapRes!14268))

(declare-fun b!365753 () Bool)

(declare-fun e!223982 () Bool)

(declare-datatypes ((array!20909 0))(
  ( (array!20910 (arr!9927 (Array (_ BitVec 32) (_ BitVec 64))) (size!10279 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20909)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365753 (= e!223982 (and (or (= (select (arr!9927 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9927 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!10279 _keys!658)) (bvsge (size!10279 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365754 () Bool)

(declare-fun res!204516 () Bool)

(assert (=> b!365754 (=> (not res!204516) (not e!223982))))

(assert (=> b!365754 (= res!204516 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10279 _keys!658))))))

(declare-fun b!365755 () Bool)

(declare-fun res!204519 () Bool)

(assert (=> b!365755 (=> (not res!204519) (not e!223982))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20909 (_ BitVec 32)) Bool)

(assert (=> b!365755 (= res!204519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365756 () Bool)

(declare-fun res!204517 () Bool)

(assert (=> b!365756 (=> (not res!204517) (not e!223982))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12407 0))(
  ( (V!12408 (val!4283 Int)) )
))
(declare-datatypes ((ValueCell!3895 0))(
  ( (ValueCellFull!3895 (v!6479 V!12407)) (EmptyCell!3895) )
))
(declare-datatypes ((array!20911 0))(
  ( (array!20912 (arr!9928 (Array (_ BitVec 32) ValueCell!3895)) (size!10280 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20911)

(assert (=> b!365756 (= res!204517 (and (= (size!10280 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10279 _keys!658) (size!10280 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365757 () Bool)

(declare-fun res!204515 () Bool)

(assert (=> b!365757 (=> (not res!204515) (not e!223982))))

(declare-datatypes ((List!5534 0))(
  ( (Nil!5531) (Cons!5530 (h!6386 (_ BitVec 64)) (t!10684 List!5534)) )
))
(declare-fun arrayNoDuplicates!0 (array!20909 (_ BitVec 32) List!5534) Bool)

(assert (=> b!365757 (= res!204515 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5531))))

(declare-fun mapNonEmpty!14268 () Bool)

(declare-fun tp!28344 () Bool)

(declare-fun e!223980 () Bool)

(assert (=> mapNonEmpty!14268 (= mapRes!14268 (and tp!28344 e!223980))))

(declare-fun mapRest!14268 () (Array (_ BitVec 32) ValueCell!3895))

(declare-fun mapKey!14268 () (_ BitVec 32))

(declare-fun mapValue!14268 () ValueCell!3895)

(assert (=> mapNonEmpty!14268 (= (arr!9928 _values!506) (store mapRest!14268 mapKey!14268 mapValue!14268))))

(declare-fun b!365759 () Bool)

(declare-fun tp_is_empty!8477 () Bool)

(assert (=> b!365759 (= e!223980 tp_is_empty!8477)))

(declare-fun b!365760 () Bool)

(declare-fun res!204514 () Bool)

(assert (=> b!365760 (=> (not res!204514) (not e!223982))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365760 (= res!204514 (validKeyInArray!0 k!778))))

(declare-fun b!365761 () Bool)

(declare-fun e!223981 () Bool)

(declare-fun e!223979 () Bool)

(assert (=> b!365761 (= e!223981 (and e!223979 mapRes!14268))))

(declare-fun condMapEmpty!14268 () Bool)

(declare-fun mapDefault!14268 () ValueCell!3895)

