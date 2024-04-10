; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83106 () Bool)

(assert start!83106)

(declare-fun b_free!19099 () Bool)

(declare-fun b_next!19099 () Bool)

(assert (=> start!83106 (= b_free!19099 (not b_next!19099))))

(declare-fun tp!66575 () Bool)

(declare-fun b_and!30587 () Bool)

(assert (=> start!83106 (= tp!66575 b_and!30587)))

(declare-fun b!969431 () Bool)

(declare-fun e!546543 () Bool)

(assert (=> b!969431 (= e!546543 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34313 0))(
  ( (V!34314 (val!11049 Int)) )
))
(declare-datatypes ((ValueCell!10517 0))(
  ( (ValueCellFull!10517 (v!13608 V!34313)) (EmptyCell!10517) )
))
(declare-datatypes ((array!60059 0))(
  ( (array!60060 (arr!28893 (Array (_ BitVec 32) ValueCell!10517)) (size!29372 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60059)

(declare-fun lt!431636 () Bool)

(declare-fun zeroValue!1367 () V!34313)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34313)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60061 0))(
  ( (array!60062 (arr!28894 (Array (_ BitVec 32) (_ BitVec 64))) (size!29373 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60061)

(declare-datatypes ((tuple2!14158 0))(
  ( (tuple2!14159 (_1!7090 (_ BitVec 64)) (_2!7090 V!34313)) )
))
(declare-datatypes ((List!20027 0))(
  ( (Nil!20024) (Cons!20023 (h!21185 tuple2!14158) (t!28390 List!20027)) )
))
(declare-datatypes ((ListLongMap!12855 0))(
  ( (ListLongMap!12856 (toList!6443 List!20027)) )
))
(declare-fun contains!5547 (ListLongMap!12855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3676 (array!60061 array!60059 (_ BitVec 32) (_ BitVec 32) V!34313 V!34313 (_ BitVec 32) Int) ListLongMap!12855)

(assert (=> b!969431 (= lt!431636 (contains!5547 (getCurrentListMap!3676 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28894 _keys!1717) i!822)))))

(declare-fun b!969432 () Bool)

(declare-fun res!648857 () Bool)

(assert (=> b!969432 (=> (not res!648857) (not e!546543))))

(assert (=> b!969432 (= res!648857 (and (= (size!29372 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29373 _keys!1717) (size!29372 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969434 () Bool)

(declare-fun e!546542 () Bool)

(declare-fun e!546541 () Bool)

(declare-fun mapRes!35005 () Bool)

(assert (=> b!969434 (= e!546542 (and e!546541 mapRes!35005))))

(declare-fun condMapEmpty!35005 () Bool)

(declare-fun mapDefault!35005 () ValueCell!10517)

