; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82592 () Bool)

(assert start!82592)

(declare-fun b_free!18725 () Bool)

(declare-fun b_next!18725 () Bool)

(assert (=> start!82592 (= b_free!18725 (not b_next!18725))))

(declare-fun tp!65294 () Bool)

(declare-fun b_and!30213 () Bool)

(assert (=> start!82592 (= tp!65294 b_and!30213)))

(declare-fun mapNonEmpty!34285 () Bool)

(declare-fun mapRes!34285 () Bool)

(declare-fun tp!65295 () Bool)

(declare-fun e!542823 () Bool)

(assert (=> mapNonEmpty!34285 (= mapRes!34285 (and tp!65295 e!542823))))

(declare-fun mapKey!34285 () (_ BitVec 32))

(declare-datatypes ((V!33685 0))(
  ( (V!33686 (val!10814 Int)) )
))
(declare-datatypes ((ValueCell!10282 0))(
  ( (ValueCellFull!10282 (v!13372 V!33685)) (EmptyCell!10282) )
))
(declare-fun mapRest!34285 () (Array (_ BitVec 32) ValueCell!10282))

(declare-datatypes ((array!59151 0))(
  ( (array!59152 (arr!28444 (Array (_ BitVec 32) ValueCell!10282)) (size!28923 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59151)

(declare-fun mapValue!34285 () ValueCell!10282)

(assert (=> mapNonEmpty!34285 (= (arr!28444 _values!1400) (store mapRest!34285 mapKey!34285 mapValue!34285))))

(declare-fun b!962573 () Bool)

(declare-fun res!644179 () Bool)

(declare-fun e!542824 () Bool)

(assert (=> b!962573 (=> (not res!644179) (not e!542824))))

(declare-datatypes ((array!59153 0))(
  ( (array!59154 (arr!28445 (Array (_ BitVec 32) (_ BitVec 64))) (size!28924 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59153)

(declare-datatypes ((List!19739 0))(
  ( (Nil!19736) (Cons!19735 (h!20897 (_ BitVec 64)) (t!28102 List!19739)) )
))
(declare-fun arrayNoDuplicates!0 (array!59153 (_ BitVec 32) List!19739) Bool)

(assert (=> b!962573 (= res!644179 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19736))))

(declare-fun b!962574 () Bool)

(declare-fun tp_is_empty!21527 () Bool)

(assert (=> b!962574 (= e!542823 tp_is_empty!21527)))

(declare-fun mapIsEmpty!34285 () Bool)

(assert (=> mapIsEmpty!34285 mapRes!34285))

(declare-fun b!962575 () Bool)

(assert (=> b!962575 (= e!542824 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33685)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!430891 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33685)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13888 0))(
  ( (tuple2!13889 (_1!6955 (_ BitVec 64)) (_2!6955 V!33685)) )
))
(declare-datatypes ((List!19740 0))(
  ( (Nil!19737) (Cons!19736 (h!20898 tuple2!13888) (t!28103 List!19740)) )
))
(declare-datatypes ((ListLongMap!12585 0))(
  ( (ListLongMap!12586 (toList!6308 List!19740)) )
))
(declare-fun contains!5411 (ListLongMap!12585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3541 (array!59153 array!59151 (_ BitVec 32) (_ BitVec 32) V!33685 V!33685 (_ BitVec 32) Int) ListLongMap!12585)

(assert (=> b!962575 (= lt!430891 (contains!5411 (getCurrentListMap!3541 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28445 _keys!1686) i!803)))))

(declare-fun b!962576 () Bool)

(declare-fun res!644176 () Bool)

(assert (=> b!962576 (=> (not res!644176) (not e!542824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962576 (= res!644176 (validKeyInArray!0 (select (arr!28445 _keys!1686) i!803)))))

(declare-fun b!962577 () Bool)

(declare-fun res!644175 () Bool)

(assert (=> b!962577 (=> (not res!644175) (not e!542824))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962577 (= res!644175 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28924 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28924 _keys!1686))))))

(declare-fun b!962578 () Bool)

(declare-fun e!542821 () Bool)

(assert (=> b!962578 (= e!542821 tp_is_empty!21527)))

(declare-fun res!644177 () Bool)

(assert (=> start!82592 (=> (not res!644177) (not e!542824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82592 (= res!644177 (validMask!0 mask!2110))))

(assert (=> start!82592 e!542824))

(assert (=> start!82592 true))

(declare-fun e!542825 () Bool)

(declare-fun array_inv!22039 (array!59151) Bool)

(assert (=> start!82592 (and (array_inv!22039 _values!1400) e!542825)))

(declare-fun array_inv!22040 (array!59153) Bool)

(assert (=> start!82592 (array_inv!22040 _keys!1686)))

(assert (=> start!82592 tp!65294))

(assert (=> start!82592 tp_is_empty!21527))

(declare-fun b!962579 () Bool)

(declare-fun res!644178 () Bool)

(assert (=> b!962579 (=> (not res!644178) (not e!542824))))

(assert (=> b!962579 (= res!644178 (and (= (size!28923 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28924 _keys!1686) (size!28923 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962580 () Bool)

(assert (=> b!962580 (= e!542825 (and e!542821 mapRes!34285))))

(declare-fun condMapEmpty!34285 () Bool)

(declare-fun mapDefault!34285 () ValueCell!10282)

