; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35868 () Bool)

(assert start!35868)

(declare-fun b!360645 () Bool)

(declare-fun res!200607 () Bool)

(declare-fun e!220786 () Bool)

(assert (=> b!360645 (=> (not res!200607) (not e!220786))))

(declare-datatypes ((array!20193 0))(
  ( (array!20194 (arr!9590 (Array (_ BitVec 32) (_ BitVec 64))) (size!9942 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20193)

(declare-datatypes ((List!5493 0))(
  ( (Nil!5490) (Cons!5489 (h!6345 (_ BitVec 64)) (t!10643 List!5493)) )
))
(declare-fun arrayNoDuplicates!0 (array!20193 (_ BitVec 32) List!5493) Bool)

(assert (=> b!360645 (= res!200607 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5490))))

(declare-fun mapIsEmpty!13989 () Bool)

(declare-fun mapRes!13989 () Bool)

(assert (=> mapIsEmpty!13989 mapRes!13989))

(declare-fun mapNonEmpty!13989 () Bool)

(declare-fun tp!28056 () Bool)

(declare-fun e!220787 () Bool)

(assert (=> mapNonEmpty!13989 (= mapRes!13989 (and tp!28056 e!220787))))

(declare-fun mapKey!13989 () (_ BitVec 32))

(declare-datatypes ((V!12071 0))(
  ( (V!12072 (val!4205 Int)) )
))
(declare-datatypes ((ValueCell!3817 0))(
  ( (ValueCellFull!3817 (v!6399 V!12071)) (EmptyCell!3817) )
))
(declare-fun mapValue!13989 () ValueCell!3817)

(declare-datatypes ((array!20195 0))(
  ( (array!20196 (arr!9591 (Array (_ BitVec 32) ValueCell!3817)) (size!9943 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20195)

(declare-fun mapRest!13989 () (Array (_ BitVec 32) ValueCell!3817))

(assert (=> mapNonEmpty!13989 (= (arr!9591 _values!1208) (store mapRest!13989 mapKey!13989 mapValue!13989))))

(declare-fun b!360646 () Bool)

(declare-fun res!200609 () Bool)

(assert (=> b!360646 (=> (not res!200609) (not e!220786))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360646 (= res!200609 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9942 _keys!1456))))))

(declare-fun res!200610 () Bool)

(assert (=> start!35868 (=> (not res!200610) (not e!220786))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35868 (= res!200610 (validMask!0 mask!1842))))

(assert (=> start!35868 e!220786))

(declare-fun tp_is_empty!8321 () Bool)

(assert (=> start!35868 tp_is_empty!8321))

(assert (=> start!35868 true))

(declare-fun array_inv!7056 (array!20193) Bool)

(assert (=> start!35868 (array_inv!7056 _keys!1456)))

(declare-fun e!220785 () Bool)

(declare-fun array_inv!7057 (array!20195) Bool)

(assert (=> start!35868 (and (array_inv!7057 _values!1208) e!220785)))

(declare-fun b!360647 () Bool)

(declare-fun res!200611 () Bool)

(assert (=> b!360647 (=> (not res!200611) (not e!220786))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!360647 (= res!200611 (not (= (select (arr!9590 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360648 () Bool)

(declare-fun e!220783 () Bool)

(assert (=> b!360648 (= e!220785 (and e!220783 mapRes!13989))))

(declare-fun condMapEmpty!13989 () Bool)

(declare-fun mapDefault!13989 () ValueCell!3817)

