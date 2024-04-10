; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83400 () Bool)

(assert start!83400)

(declare-fun b_free!19393 () Bool)

(declare-fun b_next!19393 () Bool)

(assert (=> start!83400 (= b_free!19393 (not b_next!19393))))

(declare-fun tp!67457 () Bool)

(declare-fun b_and!30995 () Bool)

(assert (=> start!83400 (= tp!67457 b_and!30995)))

(declare-fun res!651972 () Bool)

(declare-fun e!548997 () Bool)

(assert (=> start!83400 (=> (not res!651972) (not e!548997))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83400 (= res!651972 (validMask!0 mask!2147))))

(assert (=> start!83400 e!548997))

(assert (=> start!83400 true))

(declare-datatypes ((V!34705 0))(
  ( (V!34706 (val!11196 Int)) )
))
(declare-datatypes ((ValueCell!10664 0))(
  ( (ValueCellFull!10664 (v!13755 V!34705)) (EmptyCell!10664) )
))
(declare-datatypes ((array!60623 0))(
  ( (array!60624 (arr!29175 (Array (_ BitVec 32) ValueCell!10664)) (size!29654 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60623)

(declare-fun e!548998 () Bool)

(declare-fun array_inv!22565 (array!60623) Bool)

(assert (=> start!83400 (and (array_inv!22565 _values!1425) e!548998)))

(declare-fun tp_is_empty!22291 () Bool)

(assert (=> start!83400 tp_is_empty!22291))

(assert (=> start!83400 tp!67457))

(declare-datatypes ((array!60625 0))(
  ( (array!60626 (arr!29176 (Array (_ BitVec 32) (_ BitVec 64))) (size!29655 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60625)

(declare-fun array_inv!22566 (array!60625) Bool)

(assert (=> start!83400 (array_inv!22566 _keys!1717)))

(declare-fun b!973984 () Bool)

(declare-fun e!548999 () Bool)

(assert (=> b!973984 (= e!548999 tp_is_empty!22291)))

(declare-fun b!973985 () Bool)

(declare-fun res!651975 () Bool)

(assert (=> b!973985 (=> (not res!651975) (not e!548997))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973985 (= res!651975 (and (= (size!29654 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29655 _keys!1717) (size!29654 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35446 () Bool)

(declare-fun mapRes!35446 () Bool)

(declare-fun tp!67458 () Bool)

(declare-fun e!549000 () Bool)

(assert (=> mapNonEmpty!35446 (= mapRes!35446 (and tp!67458 e!549000))))

(declare-fun mapKey!35446 () (_ BitVec 32))

(declare-fun mapValue!35446 () ValueCell!10664)

(declare-fun mapRest!35446 () (Array (_ BitVec 32) ValueCell!10664))

(assert (=> mapNonEmpty!35446 (= (arr!29175 _values!1425) (store mapRest!35446 mapKey!35446 mapValue!35446))))

(declare-fun mapIsEmpty!35446 () Bool)

(assert (=> mapIsEmpty!35446 mapRes!35446))

(declare-fun b!973986 () Bool)

(declare-fun res!651974 () Bool)

(assert (=> b!973986 (=> (not res!651974) (not e!548997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60625 (_ BitVec 32)) Bool)

(assert (=> b!973986 (= res!651974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973987 () Bool)

(assert (=> b!973987 (= e!549000 tp_is_empty!22291)))

(declare-fun b!973988 () Bool)

(declare-fun res!651969 () Bool)

(assert (=> b!973988 (=> (not res!651969) (not e!548997))))

(declare-fun zeroValue!1367 () V!34705)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34705)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14384 0))(
  ( (tuple2!14385 (_1!7203 (_ BitVec 64)) (_2!7203 V!34705)) )
))
(declare-datatypes ((List!20243 0))(
  ( (Nil!20240) (Cons!20239 (h!21401 tuple2!14384) (t!28720 List!20243)) )
))
(declare-datatypes ((ListLongMap!13081 0))(
  ( (ListLongMap!13082 (toList!6556 List!20243)) )
))
(declare-fun contains!5646 (ListLongMap!13081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3789 (array!60625 array!60623 (_ BitVec 32) (_ BitVec 32) V!34705 V!34705 (_ BitVec 32) Int) ListLongMap!13081)

(assert (=> b!973988 (= res!651969 (contains!5646 (getCurrentListMap!3789 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29176 _keys!1717) i!822)))))

(declare-fun b!973989 () Bool)

(assert (=> b!973989 (= e!548998 (and e!548999 mapRes!35446))))

(declare-fun condMapEmpty!35446 () Bool)

(declare-fun mapDefault!35446 () ValueCell!10664)

