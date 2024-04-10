; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83166 () Bool)

(assert start!83166)

(declare-fun b_free!19159 () Bool)

(declare-fun b_next!19159 () Bool)

(assert (=> start!83166 (= b_free!19159 (not b_next!19159))))

(declare-fun tp!66756 () Bool)

(declare-fun b_and!30647 () Bool)

(assert (=> start!83166 (= tp!66756 b_and!30647)))

(declare-fun b!970250 () Bool)

(declare-fun e!546993 () Bool)

(declare-fun tp_is_empty!22057 () Bool)

(assert (=> b!970250 (= e!546993 tp_is_empty!22057)))

(declare-fun b!970251 () Bool)

(declare-fun e!546991 () Bool)

(assert (=> b!970251 (= e!546991 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34393 0))(
  ( (V!34394 (val!11079 Int)) )
))
(declare-datatypes ((ValueCell!10547 0))(
  ( (ValueCellFull!10547 (v!13638 V!34393)) (EmptyCell!10547) )
))
(declare-datatypes ((array!60173 0))(
  ( (array!60174 (arr!28950 (Array (_ BitVec 32) ValueCell!10547)) (size!29429 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60173)

(declare-fun zeroValue!1367 () V!34393)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60175 0))(
  ( (array!60176 (arr!28951 (Array (_ BitVec 32) (_ BitVec 64))) (size!29430 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60175)

(declare-fun minValue!1367 () V!34393)

(declare-fun lt!431717 () Bool)

(declare-datatypes ((tuple2!14196 0))(
  ( (tuple2!14197 (_1!7109 (_ BitVec 64)) (_2!7109 V!34393)) )
))
(declare-datatypes ((List!20067 0))(
  ( (Nil!20064) (Cons!20063 (h!21225 tuple2!14196) (t!28430 List!20067)) )
))
(declare-datatypes ((ListLongMap!12893 0))(
  ( (ListLongMap!12894 (toList!6462 List!20067)) )
))
(declare-fun contains!5566 (ListLongMap!12893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3695 (array!60175 array!60173 (_ BitVec 32) (_ BitVec 32) V!34393 V!34393 (_ BitVec 32) Int) ListLongMap!12893)

(assert (=> b!970251 (= lt!431717 (contains!5566 (getCurrentListMap!3695 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28951 _keys!1717) i!822)))))

(declare-fun res!649407 () Bool)

(assert (=> start!83166 (=> (not res!649407) (not e!546991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83166 (= res!649407 (validMask!0 mask!2147))))

(assert (=> start!83166 e!546991))

(assert (=> start!83166 true))

(declare-fun e!546994 () Bool)

(declare-fun array_inv!22411 (array!60173) Bool)

(assert (=> start!83166 (and (array_inv!22411 _values!1425) e!546994)))

(assert (=> start!83166 tp_is_empty!22057))

(assert (=> start!83166 tp!66756))

(declare-fun array_inv!22412 (array!60175) Bool)

(assert (=> start!83166 (array_inv!22412 _keys!1717)))

(declare-fun b!970252 () Bool)

(declare-fun res!649406 () Bool)

(assert (=> b!970252 (=> (not res!649406) (not e!546991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60175 (_ BitVec 32)) Bool)

(assert (=> b!970252 (= res!649406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970253 () Bool)

(declare-fun res!649405 () Bool)

(assert (=> b!970253 (=> (not res!649405) (not e!546991))))

(assert (=> b!970253 (= res!649405 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29430 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29430 _keys!1717))))))

(declare-fun b!970254 () Bool)

(declare-fun e!546992 () Bool)

(declare-fun mapRes!35095 () Bool)

(assert (=> b!970254 (= e!546994 (and e!546992 mapRes!35095))))

(declare-fun condMapEmpty!35095 () Bool)

(declare-fun mapDefault!35095 () ValueCell!10547)

