; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83464 () Bool)

(assert start!83464)

(declare-fun b_free!19451 () Bool)

(declare-fun b_next!19451 () Bool)

(assert (=> start!83464 (= b_free!19451 (not b_next!19451))))

(declare-fun tp!67641 () Bool)

(declare-fun b_and!31053 () Bool)

(assert (=> start!83464 (= tp!67641 b_and!31053)))

(declare-fun b!974917 () Bool)

(declare-fun res!652617 () Bool)

(declare-fun e!549487 () Bool)

(assert (=> b!974917 (=> (not res!652617) (not e!549487))))

(declare-datatypes ((array!60745 0))(
  ( (array!60746 (arr!29236 (Array (_ BitVec 32) (_ BitVec 64))) (size!29715 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60745)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974917 (= res!652617 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29715 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29715 _keys!1717))))))

(declare-fun b!974918 () Bool)

(declare-fun res!652614 () Bool)

(assert (=> b!974918 (=> (not res!652614) (not e!549487))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34789 0))(
  ( (V!34790 (val!11228 Int)) )
))
(declare-datatypes ((ValueCell!10696 0))(
  ( (ValueCellFull!10696 (v!13787 V!34789)) (EmptyCell!10696) )
))
(declare-datatypes ((array!60747 0))(
  ( (array!60748 (arr!29237 (Array (_ BitVec 32) ValueCell!10696)) (size!29716 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60747)

(declare-fun zeroValue!1367 () V!34789)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34789)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14432 0))(
  ( (tuple2!14433 (_1!7227 (_ BitVec 64)) (_2!7227 V!34789)) )
))
(declare-datatypes ((List!20286 0))(
  ( (Nil!20283) (Cons!20282 (h!21444 tuple2!14432) (t!28763 List!20286)) )
))
(declare-datatypes ((ListLongMap!13129 0))(
  ( (ListLongMap!13130 (toList!6580 List!20286)) )
))
(declare-fun contains!5664 (ListLongMap!13129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3813 (array!60745 array!60747 (_ BitVec 32) (_ BitVec 32) V!34789 V!34789 (_ BitVec 32) Int) ListLongMap!13129)

(assert (=> b!974918 (= res!652614 (contains!5664 (getCurrentListMap!3813 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29236 _keys!1717) i!822)))))

(declare-fun b!974919 () Bool)

(declare-fun res!652620 () Bool)

(assert (=> b!974919 (=> (not res!652620) (not e!549487))))

(declare-datatypes ((List!20287 0))(
  ( (Nil!20284) (Cons!20283 (h!21445 (_ BitVec 64)) (t!28764 List!20287)) )
))
(declare-fun arrayNoDuplicates!0 (array!60745 (_ BitVec 32) List!20287) Bool)

(assert (=> b!974919 (= res!652620 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20284))))

(declare-fun b!974920 () Bool)

(declare-fun e!549486 () Bool)

(declare-fun tp_is_empty!22355 () Bool)

(assert (=> b!974920 (= e!549486 tp_is_empty!22355)))

(declare-fun b!974921 () Bool)

(declare-fun res!652618 () Bool)

(assert (=> b!974921 (=> (not res!652618) (not e!549487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974921 (= res!652618 (validKeyInArray!0 (select (arr!29236 _keys!1717) i!822)))))

(declare-fun b!974922 () Bool)

(declare-fun res!652619 () Bool)

(assert (=> b!974922 (=> (not res!652619) (not e!549487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60745 (_ BitVec 32)) Bool)

(assert (=> b!974922 (= res!652619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35542 () Bool)

(declare-fun mapRes!35542 () Bool)

(assert (=> mapIsEmpty!35542 mapRes!35542))

(declare-fun b!974923 () Bool)

(assert (=> b!974923 (= e!549487 false)))

(declare-fun lt!432812 () ListLongMap!13129)

(assert (=> b!974923 (= lt!432812 (getCurrentListMap!3813 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974924 () Bool)

(declare-fun e!549490 () Bool)

(declare-fun e!549489 () Bool)

(assert (=> b!974924 (= e!549490 (and e!549489 mapRes!35542))))

(declare-fun condMapEmpty!35542 () Bool)

(declare-fun mapDefault!35542 () ValueCell!10696)

