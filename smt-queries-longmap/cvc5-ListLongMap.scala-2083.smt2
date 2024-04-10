; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35666 () Bool)

(assert start!35666)

(declare-fun b!358255 () Bool)

(declare-fun e!219269 () Bool)

(declare-datatypes ((array!19805 0))(
  ( (array!19806 (arr!9396 (Array (_ BitVec 32) (_ BitVec 64))) (size!9748 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19805)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!358255 (= e!219269 (bvslt (bvsub (size!9748 _keys!1456) from!1805) #b00000000000000000000000000000000))))

(declare-fun b!358256 () Bool)

(declare-fun res!199129 () Bool)

(assert (=> b!358256 (=> (not res!199129) (not e!219269))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358256 (= res!199129 (validKeyInArray!0 k!1077))))

(declare-fun b!358257 () Bool)

(declare-fun res!199125 () Bool)

(assert (=> b!358257 (=> (not res!199125) (not e!219269))))

(declare-fun arrayContainsKey!0 (array!19805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358257 (= res!199125 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!199127 () Bool)

(assert (=> start!35666 (=> (not res!199127) (not e!219269))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35666 (= res!199127 (validMask!0 mask!1842))))

(assert (=> start!35666 e!219269))

(assert (=> start!35666 true))

(declare-fun array_inv!6906 (array!19805) Bool)

(assert (=> start!35666 (array_inv!6906 _keys!1456)))

(declare-datatypes ((V!11803 0))(
  ( (V!11804 (val!4104 Int)) )
))
(declare-datatypes ((ValueCell!3716 0))(
  ( (ValueCellFull!3716 (v!6298 V!11803)) (EmptyCell!3716) )
))
(declare-datatypes ((array!19807 0))(
  ( (array!19808 (arr!9397 (Array (_ BitVec 32) ValueCell!3716)) (size!9749 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19807)

(declare-fun e!219271 () Bool)

(declare-fun array_inv!6907 (array!19807) Bool)

(assert (=> start!35666 (and (array_inv!6907 _values!1208) e!219271)))

(declare-fun mapIsEmpty!13686 () Bool)

(declare-fun mapRes!13686 () Bool)

(assert (=> mapIsEmpty!13686 mapRes!13686))

(declare-fun b!358258 () Bool)

(declare-fun e!219272 () Bool)

(declare-fun tp_is_empty!8119 () Bool)

(assert (=> b!358258 (= e!219272 tp_is_empty!8119)))

(declare-fun b!358259 () Bool)

(declare-fun e!219268 () Bool)

(assert (=> b!358259 (= e!219271 (and e!219268 mapRes!13686))))

(declare-fun condMapEmpty!13686 () Bool)

(declare-fun mapDefault!13686 () ValueCell!3716)

