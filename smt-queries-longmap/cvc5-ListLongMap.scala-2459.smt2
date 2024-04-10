; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38572 () Bool)

(assert start!38572)

(declare-fun b_free!9109 () Bool)

(declare-fun b_next!9109 () Bool)

(assert (=> start!38572 (= b_free!9109 (not b_next!9109))))

(declare-fun tp!32450 () Bool)

(declare-fun b_and!16495 () Bool)

(assert (=> start!38572 (= tp!32450 b_and!16495)))

(declare-fun b!399238 () Bool)

(declare-fun e!241148 () Bool)

(declare-fun tp_is_empty!9991 () Bool)

(assert (=> b!399238 (= e!241148 tp_is_empty!9991)))

(declare-fun b!399239 () Bool)

(declare-fun e!241151 () Bool)

(declare-datatypes ((V!14427 0))(
  ( (V!14428 (val!5040 Int)) )
))
(declare-datatypes ((tuple2!6670 0))(
  ( (tuple2!6671 (_1!3346 (_ BitVec 64)) (_2!3346 V!14427)) )
))
(declare-datatypes ((List!6597 0))(
  ( (Nil!6594) (Cons!6593 (h!7449 tuple2!6670) (t!11771 List!6597)) )
))
(declare-datatypes ((ListLongMap!5583 0))(
  ( (ListLongMap!5584 (toList!2807 List!6597)) )
))
(declare-fun call!27991 () ListLongMap!5583)

(declare-fun call!27992 () ListLongMap!5583)

(assert (=> b!399239 (= e!241151 (= call!27991 call!27992))))

(declare-fun b!399240 () Bool)

(declare-fun res!229534 () Bool)

(declare-fun e!241146 () Bool)

(assert (=> b!399240 (=> (not res!229534) (not e!241146))))

(declare-datatypes ((array!23893 0))(
  ( (array!23894 (arr!11396 (Array (_ BitVec 32) (_ BitVec 64))) (size!11748 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23893)

(declare-datatypes ((List!6598 0))(
  ( (Nil!6595) (Cons!6594 (h!7450 (_ BitVec 64)) (t!11772 List!6598)) )
))
(declare-fun arrayNoDuplicates!0 (array!23893 (_ BitVec 32) List!6598) Bool)

(assert (=> b!399240 (= res!229534 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6595))))

(declare-fun b!399242 () Bool)

(declare-fun e!241147 () Bool)

(assert (=> b!399242 (= e!241146 e!241147)))

(declare-fun res!229545 () Bool)

(assert (=> b!399242 (=> (not res!229545) (not e!241147))))

(declare-fun lt!187552 () array!23893)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23893 (_ BitVec 32)) Bool)

(assert (=> b!399242 (= res!229545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187552 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399242 (= lt!187552 (array!23894 (store (arr!11396 _keys!709) i!563 k!794) (size!11748 _keys!709)))))

(declare-fun b!399243 () Bool)

(declare-fun v!412 () V!14427)

(declare-fun +!1096 (ListLongMap!5583 tuple2!6670) ListLongMap!5583)

(assert (=> b!399243 (= e!241151 (= call!27992 (+!1096 call!27991 (tuple2!6671 k!794 v!412))))))

(declare-fun b!399244 () Bool)

(declare-fun e!241149 () Bool)

(declare-fun mapRes!16608 () Bool)

(assert (=> b!399244 (= e!241149 (and e!241148 mapRes!16608))))

(declare-fun condMapEmpty!16608 () Bool)

(declare-datatypes ((ValueCell!4652 0))(
  ( (ValueCellFull!4652 (v!7287 V!14427)) (EmptyCell!4652) )
))
(declare-datatypes ((array!23895 0))(
  ( (array!23896 (arr!11397 (Array (_ BitVec 32) ValueCell!4652)) (size!11749 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23895)

(declare-fun mapDefault!16608 () ValueCell!4652)

