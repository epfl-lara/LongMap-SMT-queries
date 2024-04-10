; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20170 () Bool)

(assert start!20170)

(declare-fun b_free!4829 () Bool)

(declare-fun b_next!4829 () Bool)

(assert (=> start!20170 (= b_free!4829 (not b_next!4829))))

(declare-fun tp!17518 () Bool)

(declare-fun b_and!11575 () Bool)

(assert (=> start!20170 (= tp!17518 b_and!11575)))

(declare-fun b!197984 () Bool)

(declare-fun res!93774 () Bool)

(declare-fun e!130195 () Bool)

(assert (=> b!197984 (=> (not res!93774) (not e!130195))))

(declare-datatypes ((array!8621 0))(
  ( (array!8622 (arr!4061 (Array (_ BitVec 32) (_ BitVec 64))) (size!4386 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8621)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!5893 0))(
  ( (V!5894 (val!2387 Int)) )
))
(declare-datatypes ((ValueCell!1999 0))(
  ( (ValueCellFull!1999 (v!4357 V!5893)) (EmptyCell!1999) )
))
(declare-datatypes ((array!8623 0))(
  ( (array!8624 (arr!4062 (Array (_ BitVec 32) ValueCell!1999)) (size!4387 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8623)

(assert (=> b!197984 (= res!93774 (and (= (size!4387 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4386 _keys!825) (size!4387 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197985 () Bool)

(declare-fun res!93770 () Bool)

(assert (=> b!197985 (=> (not res!93770) (not e!130195))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197985 (= res!93770 (= (select (arr!4061 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8096 () Bool)

(declare-fun mapRes!8096 () Bool)

(assert (=> mapIsEmpty!8096 mapRes!8096))

(declare-fun b!197987 () Bool)

(declare-fun res!93772 () Bool)

(assert (=> b!197987 (=> (not res!93772) (not e!130195))))

(assert (=> b!197987 (= res!93772 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4386 _keys!825))))))

(declare-fun b!197988 () Bool)

(assert (=> b!197988 (= e!130195 false)))

(declare-datatypes ((tuple2!3622 0))(
  ( (tuple2!3623 (_1!1822 (_ BitVec 64)) (_2!1822 V!5893)) )
))
(declare-datatypes ((List!2536 0))(
  ( (Nil!2533) (Cons!2532 (h!3174 tuple2!3622) (t!7467 List!2536)) )
))
(declare-datatypes ((ListLongMap!2535 0))(
  ( (ListLongMap!2536 (toList!1283 List!2536)) )
))
(declare-fun lt!97826 () ListLongMap!2535)

(declare-fun v!520 () V!5893)

(declare-fun zeroValue!615 () V!5893)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5893)

(declare-fun getCurrentListMapNoExtraKeys!248 (array!8621 array!8623 (_ BitVec 32) (_ BitVec 32) V!5893 V!5893 (_ BitVec 32) Int) ListLongMap!2535)

(assert (=> b!197988 (= lt!97826 (getCurrentListMapNoExtraKeys!248 _keys!825 (array!8624 (store (arr!4062 _values!649) i!601 (ValueCellFull!1999 v!520)) (size!4387 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97827 () ListLongMap!2535)

(assert (=> b!197988 (= lt!97827 (getCurrentListMapNoExtraKeys!248 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197989 () Bool)

(declare-fun res!93771 () Bool)

(assert (=> b!197989 (=> (not res!93771) (not e!130195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197989 (= res!93771 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8096 () Bool)

(declare-fun tp!17519 () Bool)

(declare-fun e!130198 () Bool)

(assert (=> mapNonEmpty!8096 (= mapRes!8096 (and tp!17519 e!130198))))

(declare-fun mapRest!8096 () (Array (_ BitVec 32) ValueCell!1999))

(declare-fun mapValue!8096 () ValueCell!1999)

(declare-fun mapKey!8096 () (_ BitVec 32))

(assert (=> mapNonEmpty!8096 (= (arr!4062 _values!649) (store mapRest!8096 mapKey!8096 mapValue!8096))))

(declare-fun b!197990 () Bool)

(declare-fun res!93773 () Bool)

(assert (=> b!197990 (=> (not res!93773) (not e!130195))))

(declare-datatypes ((List!2537 0))(
  ( (Nil!2534) (Cons!2533 (h!3175 (_ BitVec 64)) (t!7468 List!2537)) )
))
(declare-fun arrayNoDuplicates!0 (array!8621 (_ BitVec 32) List!2537) Bool)

(assert (=> b!197990 (= res!93773 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2534))))

(declare-fun b!197991 () Bool)

(declare-fun e!130196 () Bool)

(declare-fun e!130199 () Bool)

(assert (=> b!197991 (= e!130196 (and e!130199 mapRes!8096))))

(declare-fun condMapEmpty!8096 () Bool)

(declare-fun mapDefault!8096 () ValueCell!1999)

