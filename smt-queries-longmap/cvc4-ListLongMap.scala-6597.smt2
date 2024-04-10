; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83470 () Bool)

(assert start!83470)

(declare-fun b_free!19457 () Bool)

(declare-fun b_next!19457 () Bool)

(assert (=> start!83470 (= b_free!19457 (not b_next!19457))))

(declare-fun tp!67658 () Bool)

(declare-fun b_and!31059 () Bool)

(assert (=> start!83470 (= tp!67658 b_and!31059)))

(declare-fun b!975007 () Bool)

(declare-fun res!652678 () Bool)

(declare-fun e!549532 () Bool)

(assert (=> b!975007 (=> (not res!652678) (not e!549532))))

(declare-datatypes ((array!60757 0))(
  ( (array!60758 (arr!29242 (Array (_ BitVec 32) (_ BitVec 64))) (size!29721 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60757)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60757 (_ BitVec 32)) Bool)

(assert (=> b!975007 (= res!652678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975008 () Bool)

(assert (=> b!975008 (= e!549532 false)))

(declare-datatypes ((V!34797 0))(
  ( (V!34798 (val!11231 Int)) )
))
(declare-datatypes ((ValueCell!10699 0))(
  ( (ValueCellFull!10699 (v!13790 V!34797)) (EmptyCell!10699) )
))
(declare-datatypes ((array!60759 0))(
  ( (array!60760 (arr!29243 (Array (_ BitVec 32) ValueCell!10699)) (size!29722 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60759)

(declare-fun zeroValue!1367 () V!34797)

(declare-datatypes ((tuple2!14438 0))(
  ( (tuple2!14439 (_1!7230 (_ BitVec 64)) (_2!7230 V!34797)) )
))
(declare-datatypes ((List!20291 0))(
  ( (Nil!20288) (Cons!20287 (h!21449 tuple2!14438) (t!28768 List!20291)) )
))
(declare-datatypes ((ListLongMap!13135 0))(
  ( (ListLongMap!13136 (toList!6583 List!20291)) )
))
(declare-fun lt!432821 () ListLongMap!13135)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34797)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3816 (array!60757 array!60759 (_ BitVec 32) (_ BitVec 32) V!34797 V!34797 (_ BitVec 32) Int) ListLongMap!13135)

(assert (=> b!975008 (= lt!432821 (getCurrentListMap!3816 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975009 () Bool)

(declare-fun res!652680 () Bool)

(assert (=> b!975009 (=> (not res!652680) (not e!549532))))

(declare-datatypes ((List!20292 0))(
  ( (Nil!20289) (Cons!20288 (h!21450 (_ BitVec 64)) (t!28769 List!20292)) )
))
(declare-fun arrayNoDuplicates!0 (array!60757 (_ BitVec 32) List!20292) Bool)

(assert (=> b!975009 (= res!652680 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20289))))

(declare-fun b!975010 () Bool)

(declare-fun res!652682 () Bool)

(assert (=> b!975010 (=> (not res!652682) (not e!549532))))

(assert (=> b!975010 (= res!652682 (and (= (size!29722 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29721 _keys!1717) (size!29722 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975011 () Bool)

(declare-fun e!549534 () Bool)

(declare-fun e!549533 () Bool)

(declare-fun mapRes!35551 () Bool)

(assert (=> b!975011 (= e!549534 (and e!549533 mapRes!35551))))

(declare-fun condMapEmpty!35551 () Bool)

(declare-fun mapDefault!35551 () ValueCell!10699)

