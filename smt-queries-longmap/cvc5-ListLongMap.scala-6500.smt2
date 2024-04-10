; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82840 () Bool)

(assert start!82840)

(declare-fun b_free!18967 () Bool)

(declare-fun b_next!18967 () Bool)

(assert (=> start!82840 (= b_free!18967 (not b_next!18967))))

(declare-fun tp!66029 () Bool)

(declare-fun b_and!30455 () Bool)

(assert (=> start!82840 (= tp!66029 b_and!30455)))

(declare-fun b!966371 () Bool)

(declare-fun res!646860 () Bool)

(declare-fun e!544762 () Bool)

(assert (=> b!966371 (=> (not res!646860) (not e!544762))))

(declare-datatypes ((array!59635 0))(
  ( (array!59636 (arr!28686 (Array (_ BitVec 32) (_ BitVec 64))) (size!29165 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59635)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966371 (= res!646860 (validKeyInArray!0 (select (arr!28686 _keys!1686) i!803)))))

(declare-fun b!966372 () Bool)

(declare-fun res!646858 () Bool)

(assert (=> b!966372 (=> (not res!646858) (not e!544762))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966372 (= res!646858 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29165 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29165 _keys!1686))))))

(declare-fun b!966373 () Bool)

(declare-fun res!646859 () Bool)

(assert (=> b!966373 (=> (not res!646859) (not e!544762))))

(declare-datatypes ((List!19913 0))(
  ( (Nil!19910) (Cons!19909 (h!21071 (_ BitVec 64)) (t!28276 List!19913)) )
))
(declare-fun arrayNoDuplicates!0 (array!59635 (_ BitVec 32) List!19913) Bool)

(assert (=> b!966373 (= res!646859 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19910))))

(declare-fun res!646856 () Bool)

(assert (=> start!82840 (=> (not res!646856) (not e!544762))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82840 (= res!646856 (validMask!0 mask!2110))))

(assert (=> start!82840 e!544762))

(assert (=> start!82840 true))

(declare-datatypes ((V!34017 0))(
  ( (V!34018 (val!10938 Int)) )
))
(declare-datatypes ((ValueCell!10406 0))(
  ( (ValueCellFull!10406 (v!13496 V!34017)) (EmptyCell!10406) )
))
(declare-datatypes ((array!59637 0))(
  ( (array!59638 (arr!28687 (Array (_ BitVec 32) ValueCell!10406)) (size!29166 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59637)

(declare-fun e!544763 () Bool)

(declare-fun array_inv!22219 (array!59637) Bool)

(assert (=> start!82840 (and (array_inv!22219 _values!1400) e!544763)))

(declare-fun array_inv!22220 (array!59635) Bool)

(assert (=> start!82840 (array_inv!22220 _keys!1686)))

(assert (=> start!82840 tp!66029))

(declare-fun tp_is_empty!21775 () Bool)

(assert (=> start!82840 tp_is_empty!21775))

(declare-fun b!966374 () Bool)

(declare-fun e!544764 () Bool)

(assert (=> b!966374 (= e!544764 tp_is_empty!21775)))

(declare-fun b!966375 () Bool)

(declare-fun mapRes!34657 () Bool)

(assert (=> b!966375 (= e!544763 (and e!544764 mapRes!34657))))

(declare-fun condMapEmpty!34657 () Bool)

(declare-fun mapDefault!34657 () ValueCell!10406)

