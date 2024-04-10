; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82832 () Bool)

(assert start!82832)

(declare-fun b_free!18959 () Bool)

(declare-fun b_next!18959 () Bool)

(assert (=> start!82832 (= b_free!18959 (not b_next!18959))))

(declare-fun tp!66005 () Bool)

(declare-fun b_and!30447 () Bool)

(assert (=> start!82832 (= tp!66005 b_and!30447)))

(declare-fun b!966264 () Bool)

(declare-fun res!646787 () Bool)

(declare-fun e!544706 () Bool)

(assert (=> b!966264 (=> (not res!646787) (not e!544706))))

(declare-datatypes ((array!59619 0))(
  ( (array!59620 (arr!28678 (Array (_ BitVec 32) (_ BitVec 64))) (size!29157 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59619)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59619 (_ BitVec 32)) Bool)

(assert (=> b!966264 (= res!646787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966265 () Bool)

(declare-fun res!646789 () Bool)

(assert (=> b!966265 (=> (not res!646789) (not e!544706))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966265 (= res!646789 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29157 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29157 _keys!1686))))))

(declare-fun b!966266 () Bool)

(declare-fun res!646786 () Bool)

(assert (=> b!966266 (=> (not res!646786) (not e!544706))))

(declare-datatypes ((List!19906 0))(
  ( (Nil!19903) (Cons!19902 (h!21064 (_ BitVec 64)) (t!28269 List!19906)) )
))
(declare-fun arrayNoDuplicates!0 (array!59619 (_ BitVec 32) List!19906) Bool)

(assert (=> b!966266 (= res!646786 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19903))))

(declare-fun b!966267 () Bool)

(declare-fun e!544702 () Bool)

(declare-fun e!544704 () Bool)

(declare-fun mapRes!34645 () Bool)

(assert (=> b!966267 (= e!544702 (and e!544704 mapRes!34645))))

(declare-fun condMapEmpty!34645 () Bool)

(declare-datatypes ((V!34005 0))(
  ( (V!34006 (val!10934 Int)) )
))
(declare-datatypes ((ValueCell!10402 0))(
  ( (ValueCellFull!10402 (v!13492 V!34005)) (EmptyCell!10402) )
))
(declare-datatypes ((array!59621 0))(
  ( (array!59622 (arr!28679 (Array (_ BitVec 32) ValueCell!10402)) (size!29158 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59621)

(declare-fun mapDefault!34645 () ValueCell!10402)

