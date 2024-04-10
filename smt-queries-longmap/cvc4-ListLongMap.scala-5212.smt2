; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70308 () Bool)

(assert start!70308)

(declare-fun b_free!12683 () Bool)

(declare-fun b_next!12683 () Bool)

(assert (=> start!70308 (= b_free!12683 (not b_next!12683))))

(declare-fun tp!44772 () Bool)

(declare-fun b_and!21483 () Bool)

(assert (=> start!70308 (= tp!44772 b_and!21483)))

(declare-fun res!557646 () Bool)

(declare-fun e!453171 () Bool)

(assert (=> start!70308 (=> (not res!557646) (not e!453171))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70308 (= res!557646 (validMask!0 mask!1312))))

(assert (=> start!70308 e!453171))

(declare-fun tp_is_empty!14393 () Bool)

(assert (=> start!70308 tp_is_empty!14393))

(declare-datatypes ((array!44984 0))(
  ( (array!44985 (arr!21549 (Array (_ BitVec 32) (_ BitVec 64))) (size!21970 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44984)

(declare-fun array_inv!17239 (array!44984) Bool)

(assert (=> start!70308 (array_inv!17239 _keys!976)))

(assert (=> start!70308 true))

(declare-datatypes ((V!24191 0))(
  ( (V!24192 (val!7244 Int)) )
))
(declare-datatypes ((ValueCell!6781 0))(
  ( (ValueCellFull!6781 (v!9672 V!24191)) (EmptyCell!6781) )
))
(declare-datatypes ((array!44986 0))(
  ( (array!44987 (arr!21550 (Array (_ BitVec 32) ValueCell!6781)) (size!21971 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44986)

(declare-fun e!453167 () Bool)

(declare-fun array_inv!17240 (array!44986) Bool)

(assert (=> start!70308 (and (array_inv!17240 _values!788) e!453167)))

(assert (=> start!70308 tp!44772))

(declare-fun b!816823 () Bool)

(declare-fun res!557644 () Bool)

(assert (=> b!816823 (=> (not res!557644) (not e!453171))))

(declare-datatypes ((List!15348 0))(
  ( (Nil!15345) (Cons!15344 (h!16473 (_ BitVec 64)) (t!21671 List!15348)) )
))
(declare-fun arrayNoDuplicates!0 (array!44984 (_ BitVec 32) List!15348) Bool)

(assert (=> b!816823 (= res!557644 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15345))))

(declare-fun mapNonEmpty!23179 () Bool)

(declare-fun mapRes!23179 () Bool)

(declare-fun tp!44773 () Bool)

(declare-fun e!453169 () Bool)

(assert (=> mapNonEmpty!23179 (= mapRes!23179 (and tp!44773 e!453169))))

(declare-fun mapValue!23179 () ValueCell!6781)

(declare-fun mapRest!23179 () (Array (_ BitVec 32) ValueCell!6781))

(declare-fun mapKey!23179 () (_ BitVec 32))

(assert (=> mapNonEmpty!23179 (= (arr!21550 _values!788) (store mapRest!23179 mapKey!23179 mapValue!23179))))

(declare-fun b!816824 () Bool)

(declare-fun res!557645 () Bool)

(assert (=> b!816824 (=> (not res!557645) (not e!453171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44984 (_ BitVec 32)) Bool)

(assert (=> b!816824 (= res!557645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816825 () Bool)

(declare-fun e!453172 () Bool)

(assert (=> b!816825 (= e!453172 tp_is_empty!14393)))

(declare-fun b!816826 () Bool)

(assert (=> b!816826 (= e!453169 tp_is_empty!14393)))

(declare-fun b!816827 () Bool)

(assert (=> b!816827 (= e!453167 (and e!453172 mapRes!23179))))

(declare-fun condMapEmpty!23179 () Bool)

(declare-fun mapDefault!23179 () ValueCell!6781)

