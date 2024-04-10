; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83164 () Bool)

(assert start!83164)

(declare-fun b_free!19157 () Bool)

(declare-fun b_next!19157 () Bool)

(assert (=> start!83164 (= b_free!19157 (not b_next!19157))))

(declare-fun tp!66750 () Bool)

(declare-fun b_and!30645 () Bool)

(assert (=> start!83164 (= tp!66750 b_and!30645)))

(declare-fun b!970223 () Bool)

(declare-fun e!546975 () Bool)

(declare-fun tp_is_empty!22055 () Bool)

(assert (=> b!970223 (= e!546975 tp_is_empty!22055)))

(declare-fun b!970224 () Bool)

(declare-fun res!649385 () Bool)

(declare-fun e!546977 () Bool)

(assert (=> b!970224 (=> (not res!649385) (not e!546977))))

(declare-datatypes ((array!60169 0))(
  ( (array!60170 (arr!28948 (Array (_ BitVec 32) (_ BitVec 64))) (size!29427 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60169)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60169 (_ BitVec 32)) Bool)

(assert (=> b!970224 (= res!649385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970225 () Bool)

(assert (=> b!970225 (= e!546977 false)))

(declare-datatypes ((V!34389 0))(
  ( (V!34390 (val!11078 Int)) )
))
(declare-datatypes ((ValueCell!10546 0))(
  ( (ValueCellFull!10546 (v!13637 V!34389)) (EmptyCell!10546) )
))
(declare-datatypes ((array!60171 0))(
  ( (array!60172 (arr!28949 (Array (_ BitVec 32) ValueCell!10546)) (size!29428 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60171)

(declare-fun lt!431714 () Bool)

(declare-fun zeroValue!1367 () V!34389)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34389)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14194 0))(
  ( (tuple2!14195 (_1!7108 (_ BitVec 64)) (_2!7108 V!34389)) )
))
(declare-datatypes ((List!20065 0))(
  ( (Nil!20062) (Cons!20061 (h!21223 tuple2!14194) (t!28428 List!20065)) )
))
(declare-datatypes ((ListLongMap!12891 0))(
  ( (ListLongMap!12892 (toList!6461 List!20065)) )
))
(declare-fun contains!5565 (ListLongMap!12891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3694 (array!60169 array!60171 (_ BitVec 32) (_ BitVec 32) V!34389 V!34389 (_ BitVec 32) Int) ListLongMap!12891)

(assert (=> b!970225 (= lt!431714 (contains!5565 (getCurrentListMap!3694 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28948 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35092 () Bool)

(declare-fun mapRes!35092 () Bool)

(declare-fun tp!66749 () Bool)

(declare-fun e!546979 () Bool)

(assert (=> mapNonEmpty!35092 (= mapRes!35092 (and tp!66749 e!546979))))

(declare-fun mapRest!35092 () (Array (_ BitVec 32) ValueCell!10546))

(declare-fun mapKey!35092 () (_ BitVec 32))

(declare-fun mapValue!35092 () ValueCell!10546)

(assert (=> mapNonEmpty!35092 (= (arr!28949 _values!1425) (store mapRest!35092 mapKey!35092 mapValue!35092))))

(declare-fun b!970226 () Bool)

(declare-fun res!649384 () Bool)

(assert (=> b!970226 (=> (not res!649384) (not e!546977))))

(declare-datatypes ((List!20066 0))(
  ( (Nil!20063) (Cons!20062 (h!21224 (_ BitVec 64)) (t!28429 List!20066)) )
))
(declare-fun arrayNoDuplicates!0 (array!60169 (_ BitVec 32) List!20066) Bool)

(assert (=> b!970226 (= res!649384 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20063))))

(declare-fun b!970227 () Bool)

(declare-fun res!649388 () Bool)

(assert (=> b!970227 (=> (not res!649388) (not e!546977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970227 (= res!649388 (validKeyInArray!0 (select (arr!28948 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35092 () Bool)

(assert (=> mapIsEmpty!35092 mapRes!35092))

(declare-fun b!970228 () Bool)

(assert (=> b!970228 (= e!546979 tp_is_empty!22055)))

(declare-fun b!970229 () Bool)

(declare-fun res!649386 () Bool)

(assert (=> b!970229 (=> (not res!649386) (not e!546977))))

(assert (=> b!970229 (= res!649386 (and (= (size!29428 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29427 _keys!1717) (size!29428 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!649389 () Bool)

(assert (=> start!83164 (=> (not res!649389) (not e!546977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83164 (= res!649389 (validMask!0 mask!2147))))

(assert (=> start!83164 e!546977))

(assert (=> start!83164 true))

(declare-fun e!546978 () Bool)

(declare-fun array_inv!22409 (array!60171) Bool)

(assert (=> start!83164 (and (array_inv!22409 _values!1425) e!546978)))

(assert (=> start!83164 tp_is_empty!22055))

(assert (=> start!83164 tp!66750))

(declare-fun array_inv!22410 (array!60169) Bool)

(assert (=> start!83164 (array_inv!22410 _keys!1717)))

(declare-fun b!970230 () Bool)

(declare-fun res!649387 () Bool)

(assert (=> b!970230 (=> (not res!649387) (not e!546977))))

(assert (=> b!970230 (= res!649387 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29427 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29427 _keys!1717))))))

(declare-fun b!970231 () Bool)

(assert (=> b!970231 (= e!546978 (and e!546975 mapRes!35092))))

(declare-fun condMapEmpty!35092 () Bool)

(declare-fun mapDefault!35092 () ValueCell!10546)

