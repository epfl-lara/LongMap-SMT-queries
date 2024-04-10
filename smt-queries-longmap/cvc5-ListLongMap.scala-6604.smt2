; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83508 () Bool)

(assert start!83508)

(declare-fun b_free!19495 () Bool)

(declare-fun b_next!19495 () Bool)

(assert (=> start!83508 (= b_free!19495 (not b_next!19495))))

(declare-fun tp!67772 () Bool)

(declare-fun b_and!31097 () Bool)

(assert (=> start!83508 (= tp!67772 b_and!31097)))

(declare-fun b!975579 () Bool)

(declare-fun res!653080 () Bool)

(declare-fun e!549823 () Bool)

(assert (=> b!975579 (=> (not res!653080) (not e!549823))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34849 0))(
  ( (V!34850 (val!11250 Int)) )
))
(declare-datatypes ((ValueCell!10718 0))(
  ( (ValueCellFull!10718 (v!13809 V!34849)) (EmptyCell!10718) )
))
(declare-datatypes ((array!60829 0))(
  ( (array!60830 (arr!29278 (Array (_ BitVec 32) ValueCell!10718)) (size!29757 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60829)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60831 0))(
  ( (array!60832 (arr!29279 (Array (_ BitVec 32) (_ BitVec 64))) (size!29758 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60831)

(assert (=> b!975579 (= res!653080 (and (= (size!29757 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29758 _keys!1717) (size!29757 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!653079 () Bool)

(assert (=> start!83508 (=> (not res!653079) (not e!549823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83508 (= res!653079 (validMask!0 mask!2147))))

(assert (=> start!83508 e!549823))

(assert (=> start!83508 true))

(declare-fun e!549821 () Bool)

(declare-fun array_inv!22643 (array!60829) Bool)

(assert (=> start!83508 (and (array_inv!22643 _values!1425) e!549821)))

(declare-fun tp_is_empty!22399 () Bool)

(assert (=> start!83508 tp_is_empty!22399))

(assert (=> start!83508 tp!67772))

(declare-fun array_inv!22644 (array!60831) Bool)

(assert (=> start!83508 (array_inv!22644 _keys!1717)))

(declare-fun mapNonEmpty!35608 () Bool)

(declare-fun mapRes!35608 () Bool)

(declare-fun tp!67773 () Bool)

(declare-fun e!549819 () Bool)

(assert (=> mapNonEmpty!35608 (= mapRes!35608 (and tp!67773 e!549819))))

(declare-fun mapValue!35608 () ValueCell!10718)

(declare-fun mapRest!35608 () (Array (_ BitVec 32) ValueCell!10718))

(declare-fun mapKey!35608 () (_ BitVec 32))

(assert (=> mapNonEmpty!35608 (= (arr!29278 _values!1425) (store mapRest!35608 mapKey!35608 mapValue!35608))))

(declare-fun b!975580 () Bool)

(declare-fun res!653085 () Bool)

(assert (=> b!975580 (=> (not res!653085) (not e!549823))))

(declare-datatypes ((List!20320 0))(
  ( (Nil!20317) (Cons!20316 (h!21478 (_ BitVec 64)) (t!28797 List!20320)) )
))
(declare-fun arrayNoDuplicates!0 (array!60831 (_ BitVec 32) List!20320) Bool)

(assert (=> b!975580 (= res!653085 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20317))))

(declare-fun b!975581 () Bool)

(declare-fun e!549820 () Bool)

(assert (=> b!975581 (= e!549821 (and e!549820 mapRes!35608))))

(declare-fun condMapEmpty!35608 () Bool)

(declare-fun mapDefault!35608 () ValueCell!10718)

