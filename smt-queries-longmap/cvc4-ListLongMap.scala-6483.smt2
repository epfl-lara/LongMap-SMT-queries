; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82742 () Bool)

(assert start!82742)

(declare-fun b_free!18875 () Bool)

(declare-fun b_next!18875 () Bool)

(assert (=> start!82742 (= b_free!18875 (not b_next!18875))))

(declare-fun tp!65744 () Bool)

(declare-fun b_and!30363 () Bool)

(assert (=> start!82742 (= tp!65744 b_and!30363)))

(declare-fun b!965057 () Bool)

(declare-fun res!645987 () Bool)

(declare-fun e!544030 () Bool)

(assert (=> b!965057 (=> (not res!645987) (not e!544030))))

(declare-datatypes ((array!59439 0))(
  ( (array!59440 (arr!28588 (Array (_ BitVec 32) (_ BitVec 64))) (size!29067 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59439)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965057 (= res!645987 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29067 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29067 _keys!1686))))))

(declare-fun b!965058 () Bool)

(declare-fun e!544029 () Bool)

(declare-fun tp_is_empty!21677 () Bool)

(assert (=> b!965058 (= e!544029 tp_is_empty!21677)))

(declare-fun b!965059 () Bool)

(declare-fun res!645988 () Bool)

(assert (=> b!965059 (=> (not res!645988) (not e!544030))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59439 (_ BitVec 32)) Bool)

(assert (=> b!965059 (= res!645988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!645984 () Bool)

(assert (=> start!82742 (=> (not res!645984) (not e!544030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82742 (= res!645984 (validMask!0 mask!2110))))

(assert (=> start!82742 e!544030))

(assert (=> start!82742 true))

(declare-datatypes ((V!33885 0))(
  ( (V!33886 (val!10889 Int)) )
))
(declare-datatypes ((ValueCell!10357 0))(
  ( (ValueCellFull!10357 (v!13447 V!33885)) (EmptyCell!10357) )
))
(declare-datatypes ((array!59441 0))(
  ( (array!59442 (arr!28589 (Array (_ BitVec 32) ValueCell!10357)) (size!29068 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59441)

(declare-fun e!544031 () Bool)

(declare-fun array_inv!22137 (array!59441) Bool)

(assert (=> start!82742 (and (array_inv!22137 _values!1400) e!544031)))

(declare-fun array_inv!22138 (array!59439) Bool)

(assert (=> start!82742 (array_inv!22138 _keys!1686)))

(assert (=> start!82742 tp!65744))

(assert (=> start!82742 tp_is_empty!21677))

(declare-fun b!965060 () Bool)

(declare-fun res!645985 () Bool)

(assert (=> b!965060 (=> (not res!645985) (not e!544030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965060 (= res!645985 (validKeyInArray!0 (select (arr!28588 _keys!1686) i!803)))))

(declare-fun b!965061 () Bool)

(declare-fun e!544027 () Bool)

(assert (=> b!965061 (= e!544027 tp_is_empty!21677)))

(declare-fun b!965062 () Bool)

(declare-fun res!645986 () Bool)

(assert (=> b!965062 (=> (not res!645986) (not e!544030))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965062 (= res!645986 (and (= (size!29068 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29067 _keys!1686) (size!29068 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965063 () Bool)

(assert (=> b!965063 (= e!544030 false)))

(declare-fun lt!431197 () Bool)

(declare-fun minValue!1342 () V!33885)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33885)

(declare-datatypes ((tuple2!13998 0))(
  ( (tuple2!13999 (_1!7010 (_ BitVec 64)) (_2!7010 V!33885)) )
))
(declare-datatypes ((List!19842 0))(
  ( (Nil!19839) (Cons!19838 (h!21000 tuple2!13998) (t!28205 List!19842)) )
))
(declare-datatypes ((ListLongMap!12695 0))(
  ( (ListLongMap!12696 (toList!6363 List!19842)) )
))
(declare-fun contains!5466 (ListLongMap!12695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3596 (array!59439 array!59441 (_ BitVec 32) (_ BitVec 32) V!33885 V!33885 (_ BitVec 32) Int) ListLongMap!12695)

(assert (=> b!965063 (= lt!431197 (contains!5466 (getCurrentListMap!3596 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28588 _keys!1686) i!803)))))

(declare-fun b!965064 () Bool)

(declare-fun res!645983 () Bool)

(assert (=> b!965064 (=> (not res!645983) (not e!544030))))

(declare-datatypes ((List!19843 0))(
  ( (Nil!19840) (Cons!19839 (h!21001 (_ BitVec 64)) (t!28206 List!19843)) )
))
(declare-fun arrayNoDuplicates!0 (array!59439 (_ BitVec 32) List!19843) Bool)

(assert (=> b!965064 (= res!645983 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19840))))

(declare-fun mapNonEmpty!34510 () Bool)

(declare-fun mapRes!34510 () Bool)

(declare-fun tp!65745 () Bool)

(assert (=> mapNonEmpty!34510 (= mapRes!34510 (and tp!65745 e!544027))))

(declare-fun mapValue!34510 () ValueCell!10357)

(declare-fun mapKey!34510 () (_ BitVec 32))

(declare-fun mapRest!34510 () (Array (_ BitVec 32) ValueCell!10357))

(assert (=> mapNonEmpty!34510 (= (arr!28589 _values!1400) (store mapRest!34510 mapKey!34510 mapValue!34510))))

(declare-fun mapIsEmpty!34510 () Bool)

(assert (=> mapIsEmpty!34510 mapRes!34510))

(declare-fun b!965065 () Bool)

(assert (=> b!965065 (= e!544031 (and e!544029 mapRes!34510))))

(declare-fun condMapEmpty!34510 () Bool)

(declare-fun mapDefault!34510 () ValueCell!10357)

