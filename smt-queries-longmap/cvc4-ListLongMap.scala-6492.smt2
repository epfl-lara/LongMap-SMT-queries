; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82796 () Bool)

(assert start!82796)

(declare-fun b_free!18923 () Bool)

(declare-fun b_next!18923 () Bool)

(assert (=> start!82796 (= b_free!18923 (not b_next!18923))))

(declare-fun tp!65898 () Bool)

(declare-fun b_and!30411 () Bool)

(assert (=> start!82796 (= tp!65898 b_and!30411)))

(declare-fun b!965777 () Bool)

(declare-fun e!544434 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965777 (= e!544434 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33957 0))(
  ( (V!33958 (val!10916 Int)) )
))
(declare-datatypes ((ValueCell!10384 0))(
  ( (ValueCellFull!10384 (v!13474 V!33957)) (EmptyCell!10384) )
))
(declare-datatypes ((array!59547 0))(
  ( (array!59548 (arr!28642 (Array (_ BitVec 32) ValueCell!10384)) (size!29121 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59547)

(declare-datatypes ((array!59549 0))(
  ( (array!59550 (arr!28643 (Array (_ BitVec 32) (_ BitVec 64))) (size!29122 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59549)

(declare-fun minValue!1342 () V!33957)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((tuple2!14038 0))(
  ( (tuple2!14039 (_1!7030 (_ BitVec 64)) (_2!7030 V!33957)) )
))
(declare-datatypes ((List!19881 0))(
  ( (Nil!19878) (Cons!19877 (h!21039 tuple2!14038) (t!28244 List!19881)) )
))
(declare-datatypes ((ListLongMap!12735 0))(
  ( (ListLongMap!12736 (toList!6383 List!19881)) )
))
(declare-fun lt!431260 () ListLongMap!12735)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33957)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun getCurrentListMap!3616 (array!59549 array!59547 (_ BitVec 32) (_ BitVec 32) V!33957 V!33957 (_ BitVec 32) Int) ListLongMap!12735)

(assert (=> b!965777 (= lt!431260 (getCurrentListMap!3616 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403))))

(declare-fun b!965778 () Bool)

(declare-fun e!544436 () Bool)

(declare-fun tp_is_empty!21731 () Bool)

(assert (=> b!965778 (= e!544436 tp_is_empty!21731)))

(declare-fun b!965779 () Bool)

(declare-fun res!646464 () Bool)

(assert (=> b!965779 (=> (not res!646464) (not e!544434))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965779 (= res!646464 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29122 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29122 _keys!1686))))))

(declare-fun b!965780 () Bool)

(declare-fun res!646463 () Bool)

(assert (=> b!965780 (=> (not res!646463) (not e!544434))))

(assert (=> b!965780 (= res!646463 (and (= (size!29121 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29122 _keys!1686) (size!29121 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34591 () Bool)

(declare-fun mapRes!34591 () Bool)

(declare-fun tp!65897 () Bool)

(declare-fun e!544432 () Bool)

(assert (=> mapNonEmpty!34591 (= mapRes!34591 (and tp!65897 e!544432))))

(declare-fun mapKey!34591 () (_ BitVec 32))

(declare-fun mapValue!34591 () ValueCell!10384)

(declare-fun mapRest!34591 () (Array (_ BitVec 32) ValueCell!10384))

(assert (=> mapNonEmpty!34591 (= (arr!28642 _values!1400) (store mapRest!34591 mapKey!34591 mapValue!34591))))

(declare-fun res!646465 () Bool)

(assert (=> start!82796 (=> (not res!646465) (not e!544434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82796 (= res!646465 (validMask!0 mask!2110))))

(assert (=> start!82796 e!544434))

(assert (=> start!82796 true))

(declare-fun e!544433 () Bool)

(declare-fun array_inv!22181 (array!59547) Bool)

(assert (=> start!82796 (and (array_inv!22181 _values!1400) e!544433)))

(declare-fun array_inv!22182 (array!59549) Bool)

(assert (=> start!82796 (array_inv!22182 _keys!1686)))

(assert (=> start!82796 tp!65898))

(assert (=> start!82796 tp_is_empty!21731))

(declare-fun b!965781 () Bool)

(assert (=> b!965781 (= e!544433 (and e!544436 mapRes!34591))))

(declare-fun condMapEmpty!34591 () Bool)

(declare-fun mapDefault!34591 () ValueCell!10384)

