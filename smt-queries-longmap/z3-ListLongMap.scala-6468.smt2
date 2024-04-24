; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82816 () Bool)

(assert start!82816)

(declare-fun b_free!18781 () Bool)

(declare-fun b_next!18781 () Bool)

(assert (=> start!82816 (= b_free!18781 (not b_next!18781))))

(declare-fun tp!65464 () Bool)

(declare-fun b_and!30279 () Bool)

(assert (=> start!82816 (= tp!65464 b_and!30279)))

(declare-fun b!964362 () Bool)

(declare-fun res!645155 () Bool)

(declare-fun e!543827 () Bool)

(assert (=> b!964362 (=> (not res!645155) (not e!543827))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33761 0))(
  ( (V!33762 (val!10842 Int)) )
))
(declare-datatypes ((ValueCell!10310 0))(
  ( (ValueCellFull!10310 (v!13397 V!33761)) (EmptyCell!10310) )
))
(declare-datatypes ((array!59278 0))(
  ( (array!59279 (arr!28503 (Array (_ BitVec 32) ValueCell!10310)) (size!28983 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59278)

(declare-datatypes ((array!59280 0))(
  ( (array!59281 (arr!28504 (Array (_ BitVec 32) (_ BitVec 64))) (size!28984 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59280)

(declare-fun minValue!1342 () V!33761)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33761)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13914 0))(
  ( (tuple2!13915 (_1!6968 (_ BitVec 64)) (_2!6968 V!33761)) )
))
(declare-datatypes ((List!19762 0))(
  ( (Nil!19759) (Cons!19758 (h!20926 tuple2!13914) (t!28117 List!19762)) )
))
(declare-datatypes ((ListLongMap!12613 0))(
  ( (ListLongMap!12614 (toList!6322 List!19762)) )
))
(declare-fun contains!5437 (ListLongMap!12613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3555 (array!59280 array!59278 (_ BitVec 32) (_ BitVec 32) V!33761 V!33761 (_ BitVec 32) Int) ListLongMap!12613)

(assert (=> b!964362 (= res!645155 (contains!5437 (getCurrentListMap!3555 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28504 _keys!1686) i!803)))))

(declare-fun b!964363 () Bool)

(assert (=> b!964363 (= e!543827 (not true))))

(assert (=> b!964363 (contains!5437 (getCurrentListMap!3555 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28504 _keys!1686) i!803))))

(declare-datatypes ((Unit!32202 0))(
  ( (Unit!32203) )
))
(declare-fun lt!431336 () Unit!32202)

(declare-fun lemmaInListMapFromThenInFromMinusOne!15 (array!59280 array!59278 (_ BitVec 32) (_ BitVec 32) V!33761 V!33761 (_ BitVec 32) (_ BitVec 32) Int) Unit!32202)

(assert (=> b!964363 (= lt!431336 (lemmaInListMapFromThenInFromMinusOne!15 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964364 () Bool)

(declare-fun res!645156 () Bool)

(assert (=> b!964364 (=> (not res!645156) (not e!543827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964364 (= res!645156 (validKeyInArray!0 (select (arr!28504 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34369 () Bool)

(declare-fun mapRes!34369 () Bool)

(assert (=> mapIsEmpty!34369 mapRes!34369))

(declare-fun mapNonEmpty!34369 () Bool)

(declare-fun tp!65463 () Bool)

(declare-fun e!543825 () Bool)

(assert (=> mapNonEmpty!34369 (= mapRes!34369 (and tp!65463 e!543825))))

(declare-fun mapKey!34369 () (_ BitVec 32))

(declare-fun mapValue!34369 () ValueCell!10310)

(declare-fun mapRest!34369 () (Array (_ BitVec 32) ValueCell!10310))

(assert (=> mapNonEmpty!34369 (= (arr!28503 _values!1400) (store mapRest!34369 mapKey!34369 mapValue!34369))))

(declare-fun b!964365 () Bool)

(declare-fun e!543824 () Bool)

(declare-fun e!543823 () Bool)

(assert (=> b!964365 (= e!543824 (and e!543823 mapRes!34369))))

(declare-fun condMapEmpty!34369 () Bool)

(declare-fun mapDefault!34369 () ValueCell!10310)

(assert (=> b!964365 (= condMapEmpty!34369 (= (arr!28503 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10310)) mapDefault!34369)))))

(declare-fun res!645153 () Bool)

(assert (=> start!82816 (=> (not res!645153) (not e!543827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82816 (= res!645153 (validMask!0 mask!2110))))

(assert (=> start!82816 e!543827))

(assert (=> start!82816 true))

(declare-fun array_inv!22145 (array!59278) Bool)

(assert (=> start!82816 (and (array_inv!22145 _values!1400) e!543824)))

(declare-fun array_inv!22146 (array!59280) Bool)

(assert (=> start!82816 (array_inv!22146 _keys!1686)))

(assert (=> start!82816 tp!65464))

(declare-fun tp_is_empty!21583 () Bool)

(assert (=> start!82816 tp_is_empty!21583))

(declare-fun b!964366 () Bool)

(declare-fun res!645152 () Bool)

(assert (=> b!964366 (=> (not res!645152) (not e!543827))))

(assert (=> b!964366 (= res!645152 (and (= (size!28983 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28984 _keys!1686) (size!28983 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964367 () Bool)

(declare-fun res!645157 () Bool)

(assert (=> b!964367 (=> (not res!645157) (not e!543827))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964367 (= res!645157 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28984 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28984 _keys!1686))))))

(declare-fun b!964368 () Bool)

(assert (=> b!964368 (= e!543823 tp_is_empty!21583)))

(declare-fun b!964369 () Bool)

(assert (=> b!964369 (= e!543825 tp_is_empty!21583)))

(declare-fun b!964370 () Bool)

(declare-fun res!645159 () Bool)

(assert (=> b!964370 (=> (not res!645159) (not e!543827))))

(assert (=> b!964370 (= res!645159 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964371 () Bool)

(declare-fun res!645158 () Bool)

(assert (=> b!964371 (=> (not res!645158) (not e!543827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59280 (_ BitVec 32)) Bool)

(assert (=> b!964371 (= res!645158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964372 () Bool)

(declare-fun res!645154 () Bool)

(assert (=> b!964372 (=> (not res!645154) (not e!543827))))

(declare-datatypes ((List!19763 0))(
  ( (Nil!19760) (Cons!19759 (h!20927 (_ BitVec 64)) (t!28118 List!19763)) )
))
(declare-fun arrayNoDuplicates!0 (array!59280 (_ BitVec 32) List!19763) Bool)

(assert (=> b!964372 (= res!645154 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19760))))

(assert (= (and start!82816 res!645153) b!964366))

(assert (= (and b!964366 res!645152) b!964371))

(assert (= (and b!964371 res!645158) b!964372))

(assert (= (and b!964372 res!645154) b!964367))

(assert (= (and b!964367 res!645157) b!964364))

(assert (= (and b!964364 res!645156) b!964362))

(assert (= (and b!964362 res!645155) b!964370))

(assert (= (and b!964370 res!645159) b!964363))

(assert (= (and b!964365 condMapEmpty!34369) mapIsEmpty!34369))

(assert (= (and b!964365 (not condMapEmpty!34369)) mapNonEmpty!34369))

(get-info :version)

(assert (= (and mapNonEmpty!34369 ((_ is ValueCellFull!10310) mapValue!34369)) b!964369))

(assert (= (and b!964365 ((_ is ValueCellFull!10310) mapDefault!34369)) b!964368))

(assert (= start!82816 b!964365))

(declare-fun m!894169 () Bool)

(assert (=> b!964362 m!894169))

(declare-fun m!894171 () Bool)

(assert (=> b!964362 m!894171))

(assert (=> b!964362 m!894169))

(assert (=> b!964362 m!894171))

(declare-fun m!894173 () Bool)

(assert (=> b!964362 m!894173))

(declare-fun m!894175 () Bool)

(assert (=> mapNonEmpty!34369 m!894175))

(declare-fun m!894177 () Bool)

(assert (=> b!964372 m!894177))

(declare-fun m!894179 () Bool)

(assert (=> b!964363 m!894179))

(assert (=> b!964363 m!894171))

(assert (=> b!964363 m!894179))

(assert (=> b!964363 m!894171))

(declare-fun m!894181 () Bool)

(assert (=> b!964363 m!894181))

(declare-fun m!894183 () Bool)

(assert (=> b!964363 m!894183))

(declare-fun m!894185 () Bool)

(assert (=> b!964371 m!894185))

(declare-fun m!894187 () Bool)

(assert (=> start!82816 m!894187))

(declare-fun m!894189 () Bool)

(assert (=> start!82816 m!894189))

(declare-fun m!894191 () Bool)

(assert (=> start!82816 m!894191))

(assert (=> b!964364 m!894171))

(assert (=> b!964364 m!894171))

(declare-fun m!894193 () Bool)

(assert (=> b!964364 m!894193))

(check-sat (not b!964371) (not b!964362) b_and!30279 (not b_next!18781) (not b!964364) tp_is_empty!21583 (not start!82816) (not b!964363) (not b!964372) (not mapNonEmpty!34369))
(check-sat b_and!30279 (not b_next!18781))
