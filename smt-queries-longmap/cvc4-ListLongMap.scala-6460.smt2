; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82604 () Bool)

(assert start!82604)

(declare-fun b_free!18737 () Bool)

(declare-fun b_next!18737 () Bool)

(assert (=> start!82604 (= b_free!18737 (not b_next!18737))))

(declare-fun tp!65331 () Bool)

(declare-fun b_and!30225 () Bool)

(assert (=> start!82604 (= tp!65331 b_and!30225)))

(declare-fun res!644283 () Bool)

(declare-fun e!542914 () Bool)

(assert (=> start!82604 (=> (not res!644283) (not e!542914))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82604 (= res!644283 (validMask!0 mask!2110))))

(assert (=> start!82604 e!542914))

(assert (=> start!82604 true))

(declare-datatypes ((V!33701 0))(
  ( (V!33702 (val!10820 Int)) )
))
(declare-datatypes ((ValueCell!10288 0))(
  ( (ValueCellFull!10288 (v!13378 V!33701)) (EmptyCell!10288) )
))
(declare-datatypes ((array!59173 0))(
  ( (array!59174 (arr!28455 (Array (_ BitVec 32) ValueCell!10288)) (size!28934 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59173)

(declare-fun e!542911 () Bool)

(declare-fun array_inv!22047 (array!59173) Bool)

(assert (=> start!82604 (and (array_inv!22047 _values!1400) e!542911)))

(declare-datatypes ((array!59175 0))(
  ( (array!59176 (arr!28456 (Array (_ BitVec 32) (_ BitVec 64))) (size!28935 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59175)

(declare-fun array_inv!22048 (array!59175) Bool)

(assert (=> start!82604 (array_inv!22048 _keys!1686)))

(assert (=> start!82604 tp!65331))

(declare-fun tp_is_empty!21539 () Bool)

(assert (=> start!82604 tp_is_empty!21539))

(declare-fun b!962735 () Bool)

(declare-fun res!644285 () Bool)

(assert (=> b!962735 (=> (not res!644285) (not e!542914))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962735 (= res!644285 (validKeyInArray!0 (select (arr!28456 _keys!1686) i!803)))))

(declare-fun b!962736 () Bool)

(declare-fun e!542912 () Bool)

(assert (=> b!962736 (= e!542912 tp_is_empty!21539)))

(declare-fun b!962737 () Bool)

(declare-fun res!644284 () Bool)

(assert (=> b!962737 (=> (not res!644284) (not e!542914))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962737 (= res!644284 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28935 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28935 _keys!1686))))))

(declare-fun b!962738 () Bool)

(assert (=> b!962738 (= e!542914 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33701)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430909 () Bool)

(declare-fun zeroValue!1342 () V!33701)

(declare-datatypes ((tuple2!13898 0))(
  ( (tuple2!13899 (_1!6960 (_ BitVec 64)) (_2!6960 V!33701)) )
))
(declare-datatypes ((List!19748 0))(
  ( (Nil!19745) (Cons!19744 (h!20906 tuple2!13898) (t!28111 List!19748)) )
))
(declare-datatypes ((ListLongMap!12595 0))(
  ( (ListLongMap!12596 (toList!6313 List!19748)) )
))
(declare-fun contains!5416 (ListLongMap!12595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3546 (array!59175 array!59173 (_ BitVec 32) (_ BitVec 32) V!33701 V!33701 (_ BitVec 32) Int) ListLongMap!12595)

(assert (=> b!962738 (= lt!430909 (contains!5416 (getCurrentListMap!3546 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28456 _keys!1686) i!803)))))

(declare-fun b!962739 () Bool)

(declare-fun res!644282 () Bool)

(assert (=> b!962739 (=> (not res!644282) (not e!542914))))

(assert (=> b!962739 (= res!644282 (and (= (size!28934 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28935 _keys!1686) (size!28934 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962740 () Bool)

(declare-fun mapRes!34303 () Bool)

(assert (=> b!962740 (= e!542911 (and e!542912 mapRes!34303))))

(declare-fun condMapEmpty!34303 () Bool)

(declare-fun mapDefault!34303 () ValueCell!10288)

