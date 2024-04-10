; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38608 () Bool)

(assert start!38608)

(declare-fun b_free!9145 () Bool)

(declare-fun b_next!9145 () Bool)

(assert (=> start!38608 (= b_free!9145 (not b_next!9145))))

(declare-fun tp!32559 () Bool)

(declare-fun b_and!16531 () Bool)

(assert (=> start!38608 (= tp!32559 b_and!16531)))

(declare-fun b!400156 () Bool)

(declare-fun res!230186 () Bool)

(declare-fun e!241527 () Bool)

(assert (=> b!400156 (=> (not res!230186) (not e!241527))))

(declare-datatypes ((array!23965 0))(
  ( (array!23966 (arr!11432 (Array (_ BitVec 32) (_ BitVec 64))) (size!11784 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23965)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400156 (= res!230186 (or (= (select (arr!11432 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11432 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400157 () Bool)

(declare-fun e!241529 () Bool)

(assert (=> b!400157 (= e!241527 e!241529)))

(declare-fun res!230190 () Bool)

(assert (=> b!400157 (=> (not res!230190) (not e!241529))))

(declare-fun lt!187660 () array!23965)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23965 (_ BitVec 32)) Bool)

(assert (=> b!400157 (= res!230190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187660 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!400157 (= lt!187660 (array!23966 (store (arr!11432 _keys!709) i!563 k!794) (size!11784 _keys!709)))))

(declare-fun b!400158 () Bool)

(declare-fun res!230185 () Bool)

(assert (=> b!400158 (=> (not res!230185) (not e!241529))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400158 (= res!230185 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11784 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400160 () Bool)

(declare-fun e!241526 () Bool)

(declare-datatypes ((V!14475 0))(
  ( (V!14476 (val!5058 Int)) )
))
(declare-datatypes ((tuple2!6704 0))(
  ( (tuple2!6705 (_1!3363 (_ BitVec 64)) (_2!3363 V!14475)) )
))
(declare-datatypes ((List!6628 0))(
  ( (Nil!6625) (Cons!6624 (h!7480 tuple2!6704) (t!11802 List!6628)) )
))
(declare-datatypes ((ListLongMap!5617 0))(
  ( (ListLongMap!5618 (toList!2824 List!6628)) )
))
(declare-fun call!28100 () ListLongMap!5617)

(declare-fun call!28099 () ListLongMap!5617)

(declare-fun v!412 () V!14475)

(declare-fun +!1112 (ListLongMap!5617 tuple2!6704) ListLongMap!5617)

(assert (=> b!400160 (= e!241526 (= call!28100 (+!1112 call!28099 (tuple2!6705 k!794 v!412))))))

(declare-fun b!400161 () Bool)

(declare-fun res!230182 () Bool)

(assert (=> b!400161 (=> (not res!230182) (not e!241527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400161 (= res!230182 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!16662 () Bool)

(declare-fun mapRes!16662 () Bool)

(declare-fun tp!32558 () Bool)

(declare-fun e!241530 () Bool)

(assert (=> mapNonEmpty!16662 (= mapRes!16662 (and tp!32558 e!241530))))

(declare-datatypes ((ValueCell!4670 0))(
  ( (ValueCellFull!4670 (v!7305 V!14475)) (EmptyCell!4670) )
))
(declare-fun mapRest!16662 () (Array (_ BitVec 32) ValueCell!4670))

(declare-fun mapKey!16662 () (_ BitVec 32))

(declare-datatypes ((array!23967 0))(
  ( (array!23968 (arr!11433 (Array (_ BitVec 32) ValueCell!4670)) (size!11785 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23967)

(declare-fun mapValue!16662 () ValueCell!4670)

(assert (=> mapNonEmpty!16662 (= (arr!11433 _values!549) (store mapRest!16662 mapKey!16662 mapValue!16662))))

(declare-fun b!400162 () Bool)

(declare-fun e!241524 () Bool)

(declare-fun tp_is_empty!10027 () Bool)

(assert (=> b!400162 (= e!241524 tp_is_empty!10027)))

(declare-fun b!400163 () Bool)

(declare-fun e!241528 () Bool)

(assert (=> b!400163 (= e!241528 (and e!241524 mapRes!16662))))

(declare-fun condMapEmpty!16662 () Bool)

(declare-fun mapDefault!16662 () ValueCell!4670)

