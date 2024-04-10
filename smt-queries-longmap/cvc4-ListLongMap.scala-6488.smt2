; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82772 () Bool)

(assert start!82772)

(declare-fun b_free!18905 () Bool)

(declare-fun b_next!18905 () Bool)

(assert (=> start!82772 (= b_free!18905 (not b_next!18905))))

(declare-fun tp!65835 () Bool)

(declare-fun b_and!30393 () Bool)

(assert (=> start!82772 (= tp!65835 b_and!30393)))

(declare-fun b!965462 () Bool)

(declare-fun e!544255 () Bool)

(declare-fun tp_is_empty!21707 () Bool)

(assert (=> b!965462 (= e!544255 tp_is_empty!21707)))

(declare-fun b!965463 () Bool)

(declare-fun res!646253 () Bool)

(declare-fun e!544252 () Bool)

(assert (=> b!965463 (=> (not res!646253) (not e!544252))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33925 0))(
  ( (V!33926 (val!10904 Int)) )
))
(declare-datatypes ((ValueCell!10372 0))(
  ( (ValueCellFull!10372 (v!13462 V!33925)) (EmptyCell!10372) )
))
(declare-datatypes ((array!59499 0))(
  ( (array!59500 (arr!28618 (Array (_ BitVec 32) ValueCell!10372)) (size!29097 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59499)

(declare-datatypes ((array!59501 0))(
  ( (array!59502 (arr!28619 (Array (_ BitVec 32) (_ BitVec 64))) (size!29098 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59501)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965463 (= res!646253 (and (= (size!29097 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29098 _keys!1686) (size!29097 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34555 () Bool)

(declare-fun mapRes!34555 () Bool)

(declare-fun tp!65834 () Bool)

(declare-fun e!544256 () Bool)

(assert (=> mapNonEmpty!34555 (= mapRes!34555 (and tp!65834 e!544256))))

(declare-fun mapValue!34555 () ValueCell!10372)

(declare-fun mapRest!34555 () (Array (_ BitVec 32) ValueCell!10372))

(declare-fun mapKey!34555 () (_ BitVec 32))

(assert (=> mapNonEmpty!34555 (= (arr!28618 _values!1400) (store mapRest!34555 mapKey!34555 mapValue!34555))))

(declare-fun b!965464 () Bool)

(declare-fun res!646255 () Bool)

(assert (=> b!965464 (=> (not res!646255) (not e!544252))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965464 (= res!646255 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29098 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29098 _keys!1686))))))

(declare-fun b!965465 () Bool)

(assert (=> b!965465 (= e!544252 false)))

(declare-fun lt!431242 () Bool)

(declare-fun minValue!1342 () V!33925)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33925)

(declare-datatypes ((tuple2!14024 0))(
  ( (tuple2!14025 (_1!7023 (_ BitVec 64)) (_2!7023 V!33925)) )
))
(declare-datatypes ((List!19867 0))(
  ( (Nil!19864) (Cons!19863 (h!21025 tuple2!14024) (t!28230 List!19867)) )
))
(declare-datatypes ((ListLongMap!12721 0))(
  ( (ListLongMap!12722 (toList!6376 List!19867)) )
))
(declare-fun contains!5479 (ListLongMap!12721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3609 (array!59501 array!59499 (_ BitVec 32) (_ BitVec 32) V!33925 V!33925 (_ BitVec 32) Int) ListLongMap!12721)

(assert (=> b!965465 (= lt!431242 (contains!5479 (getCurrentListMap!3609 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28619 _keys!1686) i!803)))))

(declare-fun b!965467 () Bool)

(declare-fun res!646256 () Bool)

(assert (=> b!965467 (=> (not res!646256) (not e!544252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965467 (= res!646256 (validKeyInArray!0 (select (arr!28619 _keys!1686) i!803)))))

(declare-fun b!965468 () Bool)

(assert (=> b!965468 (= e!544256 tp_is_empty!21707)))

(declare-fun b!965469 () Bool)

(declare-fun res!646257 () Bool)

(assert (=> b!965469 (=> (not res!646257) (not e!544252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59501 (_ BitVec 32)) Bool)

(assert (=> b!965469 (= res!646257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965470 () Bool)

(declare-fun e!544254 () Bool)

(assert (=> b!965470 (= e!544254 (and e!544255 mapRes!34555))))

(declare-fun condMapEmpty!34555 () Bool)

(declare-fun mapDefault!34555 () ValueCell!10372)

