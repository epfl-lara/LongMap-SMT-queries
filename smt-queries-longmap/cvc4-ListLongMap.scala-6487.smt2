; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82766 () Bool)

(assert start!82766)

(declare-fun b_free!18899 () Bool)

(declare-fun b_next!18899 () Bool)

(assert (=> start!82766 (= b_free!18899 (not b_next!18899))))

(declare-fun tp!65817 () Bool)

(declare-fun b_and!30387 () Bool)

(assert (=> start!82766 (= tp!65817 b_and!30387)))

(declare-fun mapNonEmpty!34546 () Bool)

(declare-fun mapRes!34546 () Bool)

(declare-fun tp!65816 () Bool)

(declare-fun e!544211 () Bool)

(assert (=> mapNonEmpty!34546 (= mapRes!34546 (and tp!65816 e!544211))))

(declare-fun mapKey!34546 () (_ BitVec 32))

(declare-datatypes ((V!33917 0))(
  ( (V!33918 (val!10901 Int)) )
))
(declare-datatypes ((ValueCell!10369 0))(
  ( (ValueCellFull!10369 (v!13459 V!33917)) (EmptyCell!10369) )
))
(declare-fun mapValue!34546 () ValueCell!10369)

(declare-datatypes ((array!59487 0))(
  ( (array!59488 (arr!28612 (Array (_ BitVec 32) ValueCell!10369)) (size!29091 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59487)

(declare-fun mapRest!34546 () (Array (_ BitVec 32) ValueCell!10369))

(assert (=> mapNonEmpty!34546 (= (arr!28612 _values!1400) (store mapRest!34546 mapKey!34546 mapValue!34546))))

(declare-fun b!965381 () Bool)

(declare-fun e!544207 () Bool)

(declare-fun tp_is_empty!21701 () Bool)

(assert (=> b!965381 (= e!544207 tp_is_empty!21701)))

(declare-fun b!965383 () Bool)

(assert (=> b!965383 (= e!544211 tp_is_empty!21701)))

(declare-fun mapIsEmpty!34546 () Bool)

(assert (=> mapIsEmpty!34546 mapRes!34546))

(declare-fun b!965384 () Bool)

(declare-fun res!646202 () Bool)

(declare-fun e!544208 () Bool)

(assert (=> b!965384 (=> (not res!646202) (not e!544208))))

(declare-datatypes ((array!59489 0))(
  ( (array!59490 (arr!28613 (Array (_ BitVec 32) (_ BitVec 64))) (size!29092 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59489)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59489 (_ BitVec 32)) Bool)

(assert (=> b!965384 (= res!646202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965385 () Bool)

(declare-fun res!646204 () Bool)

(assert (=> b!965385 (=> (not res!646204) (not e!544208))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965385 (= res!646204 (and (= (size!29091 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29092 _keys!1686) (size!29091 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965386 () Bool)

(declare-fun res!646203 () Bool)

(assert (=> b!965386 (=> (not res!646203) (not e!544208))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965386 (= res!646203 (validKeyInArray!0 (select (arr!28613 _keys!1686) i!803)))))

(declare-fun b!965387 () Bool)

(declare-fun res!646200 () Bool)

(assert (=> b!965387 (=> (not res!646200) (not e!544208))))

(declare-datatypes ((List!19861 0))(
  ( (Nil!19858) (Cons!19857 (h!21019 (_ BitVec 64)) (t!28224 List!19861)) )
))
(declare-fun arrayNoDuplicates!0 (array!59489 (_ BitVec 32) List!19861) Bool)

(assert (=> b!965387 (= res!646200 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19858))))

(declare-fun res!646201 () Bool)

(assert (=> start!82766 (=> (not res!646201) (not e!544208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82766 (= res!646201 (validMask!0 mask!2110))))

(assert (=> start!82766 e!544208))

(assert (=> start!82766 true))

(declare-fun e!544210 () Bool)

(declare-fun array_inv!22159 (array!59487) Bool)

(assert (=> start!82766 (and (array_inv!22159 _values!1400) e!544210)))

(declare-fun array_inv!22160 (array!59489) Bool)

(assert (=> start!82766 (array_inv!22160 _keys!1686)))

(assert (=> start!82766 tp!65817))

(assert (=> start!82766 tp_is_empty!21701))

(declare-fun b!965382 () Bool)

(assert (=> b!965382 (= e!544208 false)))

(declare-fun minValue!1342 () V!33917)

(declare-fun lt!431233 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33917)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14018 0))(
  ( (tuple2!14019 (_1!7020 (_ BitVec 64)) (_2!7020 V!33917)) )
))
(declare-datatypes ((List!19862 0))(
  ( (Nil!19859) (Cons!19858 (h!21020 tuple2!14018) (t!28225 List!19862)) )
))
(declare-datatypes ((ListLongMap!12715 0))(
  ( (ListLongMap!12716 (toList!6373 List!19862)) )
))
(declare-fun contains!5476 (ListLongMap!12715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3606 (array!59489 array!59487 (_ BitVec 32) (_ BitVec 32) V!33917 V!33917 (_ BitVec 32) Int) ListLongMap!12715)

(assert (=> b!965382 (= lt!431233 (contains!5476 (getCurrentListMap!3606 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28613 _keys!1686) i!803)))))

(declare-fun b!965388 () Bool)

(declare-fun res!646199 () Bool)

(assert (=> b!965388 (=> (not res!646199) (not e!544208))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965388 (= res!646199 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29092 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29092 _keys!1686))))))

(declare-fun b!965389 () Bool)

(assert (=> b!965389 (= e!544210 (and e!544207 mapRes!34546))))

(declare-fun condMapEmpty!34546 () Bool)

(declare-fun mapDefault!34546 () ValueCell!10369)

