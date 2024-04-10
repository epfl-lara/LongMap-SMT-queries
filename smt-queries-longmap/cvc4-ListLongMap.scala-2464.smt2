; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38606 () Bool)

(assert start!38606)

(declare-fun b_free!9143 () Bool)

(declare-fun b_next!9143 () Bool)

(assert (=> start!38606 (= b_free!9143 (not b_next!9143))))

(declare-fun tp!32552 () Bool)

(declare-fun b_and!16529 () Bool)

(assert (=> start!38606 (= tp!32552 b_and!16529)))

(declare-fun b!400105 () Bool)

(declare-fun e!241504 () Bool)

(declare-fun tp_is_empty!10025 () Bool)

(assert (=> b!400105 (= e!241504 tp_is_empty!10025)))

(declare-fun mapNonEmpty!16659 () Bool)

(declare-fun mapRes!16659 () Bool)

(declare-fun tp!32553 () Bool)

(declare-fun e!241506 () Bool)

(assert (=> mapNonEmpty!16659 (= mapRes!16659 (and tp!32553 e!241506))))

(declare-datatypes ((V!14471 0))(
  ( (V!14472 (val!5057 Int)) )
))
(declare-datatypes ((ValueCell!4669 0))(
  ( (ValueCellFull!4669 (v!7304 V!14471)) (EmptyCell!4669) )
))
(declare-fun mapValue!16659 () ValueCell!4669)

(declare-datatypes ((array!23961 0))(
  ( (array!23962 (arr!11430 (Array (_ BitVec 32) ValueCell!4669)) (size!11782 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23961)

(declare-fun mapKey!16659 () (_ BitVec 32))

(declare-fun mapRest!16659 () (Array (_ BitVec 32) ValueCell!4669))

(assert (=> mapNonEmpty!16659 (= (arr!11430 _values!549) (store mapRest!16659 mapKey!16659 mapValue!16659))))

(declare-fun b!400106 () Bool)

(declare-fun res!230155 () Bool)

(declare-fun e!241503 () Bool)

(assert (=> b!400106 (=> (not res!230155) (not e!241503))))

(declare-datatypes ((array!23963 0))(
  ( (array!23964 (arr!11431 (Array (_ BitVec 32) (_ BitVec 64))) (size!11783 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23963)

(declare-datatypes ((List!6626 0))(
  ( (Nil!6623) (Cons!6622 (h!7478 (_ BitVec 64)) (t!11800 List!6626)) )
))
(declare-fun arrayNoDuplicates!0 (array!23963 (_ BitVec 32) List!6626) Bool)

(assert (=> b!400106 (= res!230155 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6623))))

(declare-fun b!400107 () Bool)

(declare-fun res!230154 () Bool)

(assert (=> b!400107 (=> (not res!230154) (not e!241503))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400107 (= res!230154 (or (= (select (arr!11431 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11431 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400108 () Bool)

(declare-fun res!230151 () Bool)

(assert (=> b!400108 (=> (not res!230151) (not e!241503))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400108 (= res!230151 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!400109 () Bool)

(declare-fun res!230147 () Bool)

(assert (=> b!400109 (=> (not res!230147) (not e!241503))))

(assert (=> b!400109 (= res!230147 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11783 _keys!709))))))

(declare-datatypes ((tuple2!6702 0))(
  ( (tuple2!6703 (_1!3362 (_ BitVec 64)) (_2!3362 V!14471)) )
))
(declare-datatypes ((List!6627 0))(
  ( (Nil!6624) (Cons!6623 (h!7479 tuple2!6702) (t!11801 List!6627)) )
))
(declare-datatypes ((ListLongMap!5615 0))(
  ( (ListLongMap!5616 (toList!2823 List!6627)) )
))
(declare-fun call!28093 () ListLongMap!5615)

(declare-fun e!241509 () Bool)

(declare-fun call!28094 () ListLongMap!5615)

(declare-fun v!412 () V!14471)

(declare-fun b!400110 () Bool)

(declare-fun +!1111 (ListLongMap!5615 tuple2!6702) ListLongMap!5615)

(assert (=> b!400110 (= e!241509 (= call!28093 (+!1111 call!28094 (tuple2!6703 k!794 v!412))))))

(declare-fun b!400111 () Bool)

(declare-fun e!241507 () Bool)

(assert (=> b!400111 (= e!241503 e!241507)))

(declare-fun res!230150 () Bool)

(assert (=> b!400111 (=> (not res!230150) (not e!241507))))

(declare-fun lt!187655 () array!23963)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23963 (_ BitVec 32)) Bool)

(assert (=> b!400111 (= res!230150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187655 mask!1025))))

(assert (=> b!400111 (= lt!187655 (array!23964 (store (arr!11431 _keys!709) i!563 k!794) (size!11783 _keys!709)))))

(declare-fun b!400112 () Bool)

(declare-fun res!230146 () Bool)

(assert (=> b!400112 (=> (not res!230146) (not e!241507))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400112 (= res!230146 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11783 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400113 () Bool)

(declare-fun res!230156 () Bool)

(assert (=> b!400113 (=> (not res!230156) (not e!241503))))

(assert (=> b!400113 (= res!230156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230152 () Bool)

(assert (=> start!38606 (=> (not res!230152) (not e!241503))))

(assert (=> start!38606 (= res!230152 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11783 _keys!709))))))

(assert (=> start!38606 e!241503))

(assert (=> start!38606 tp_is_empty!10025))

(assert (=> start!38606 tp!32552))

(assert (=> start!38606 true))

(declare-fun e!241508 () Bool)

(declare-fun array_inv!8372 (array!23961) Bool)

(assert (=> start!38606 (and (array_inv!8372 _values!549) e!241508)))

(declare-fun array_inv!8373 (array!23963) Bool)

(assert (=> start!38606 (array_inv!8373 _keys!709)))

(declare-fun b!400114 () Bool)

(assert (=> b!400114 (= e!241508 (and e!241504 mapRes!16659))))

(declare-fun condMapEmpty!16659 () Bool)

(declare-fun mapDefault!16659 () ValueCell!4669)

