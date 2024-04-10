; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70844 () Bool)

(assert start!70844)

(declare-fun b_free!13081 () Bool)

(declare-fun b_next!13081 () Bool)

(assert (=> start!70844 (= b_free!13081 (not b_next!13081))))

(declare-fun tp!45991 () Bool)

(declare-fun b_and!21965 () Bool)

(assert (=> start!70844 (= tp!45991 b_and!21965)))

(declare-fun b!822827 () Bool)

(declare-fun res!561159 () Bool)

(declare-fun e!457527 () Bool)

(assert (=> b!822827 (=> (not res!561159) (not e!457527))))

(declare-datatypes ((array!45776 0))(
  ( (array!45777 (arr!21937 (Array (_ BitVec 32) (_ BitVec 64))) (size!22358 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45776)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45776 (_ BitVec 32)) Bool)

(assert (=> b!822827 (= res!561159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822828 () Bool)

(declare-fun e!457532 () Bool)

(declare-fun tp_is_empty!14791 () Bool)

(assert (=> b!822828 (= e!457532 tp_is_empty!14791)))

(declare-fun res!561162 () Bool)

(assert (=> start!70844 (=> (not res!561162) (not e!457527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70844 (= res!561162 (validMask!0 mask!1312))))

(assert (=> start!70844 e!457527))

(assert (=> start!70844 tp_is_empty!14791))

(declare-fun array_inv!17523 (array!45776) Bool)

(assert (=> start!70844 (array_inv!17523 _keys!976)))

(assert (=> start!70844 true))

(declare-datatypes ((V!24723 0))(
  ( (V!24724 (val!7443 Int)) )
))
(declare-datatypes ((ValueCell!6980 0))(
  ( (ValueCellFull!6980 (v!9875 V!24723)) (EmptyCell!6980) )
))
(declare-datatypes ((array!45778 0))(
  ( (array!45779 (arr!21938 (Array (_ BitVec 32) ValueCell!6980)) (size!22359 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45778)

(declare-fun e!457529 () Bool)

(declare-fun array_inv!17524 (array!45778) Bool)

(assert (=> start!70844 (and (array_inv!17524 _values!788) e!457529)))

(assert (=> start!70844 tp!45991))

(declare-fun b!822829 () Bool)

(declare-fun e!457531 () Bool)

(assert (=> b!822829 (= e!457531 true)))

(declare-datatypes ((tuple2!9832 0))(
  ( (tuple2!9833 (_1!4927 (_ BitVec 64)) (_2!4927 V!24723)) )
))
(declare-datatypes ((List!15648 0))(
  ( (Nil!15645) (Cons!15644 (h!16773 tuple2!9832) (t!21987 List!15648)) )
))
(declare-datatypes ((ListLongMap!8655 0))(
  ( (ListLongMap!8656 (toList!4343 List!15648)) )
))
(declare-fun lt!370524 () ListLongMap!8655)

(declare-fun lt!370527 () ListLongMap!8655)

(declare-fun lt!370529 () tuple2!9832)

(declare-fun +!1893 (ListLongMap!8655 tuple2!9832) ListLongMap!8655)

(assert (=> b!822829 (= lt!370524 (+!1893 lt!370527 lt!370529))))

(declare-fun lt!370523 () ListLongMap!8655)

(declare-fun zeroValueAfter!34 () V!24723)

(declare-fun minValue!754 () V!24723)

(declare-datatypes ((Unit!28152 0))(
  ( (Unit!28153) )
))
(declare-fun lt!370528 () Unit!28152)

(declare-fun addCommutativeForDiffKeys!456 (ListLongMap!8655 (_ BitVec 64) V!24723 (_ BitVec 64) V!24723) Unit!28152)

(assert (=> b!822829 (= lt!370528 (addCommutativeForDiffKeys!456 lt!370523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370530 () ListLongMap!8655)

(assert (=> b!822829 (= lt!370530 lt!370524)))

(declare-fun lt!370526 () tuple2!9832)

(assert (=> b!822829 (= lt!370524 (+!1893 (+!1893 lt!370523 lt!370529) lt!370526))))

(assert (=> b!822829 (= lt!370529 (tuple2!9833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370531 () ListLongMap!8655)

(assert (=> b!822829 (= lt!370531 lt!370527)))

(assert (=> b!822829 (= lt!370527 (+!1893 lt!370523 lt!370526))))

(assert (=> b!822829 (= lt!370526 (tuple2!9833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2507 (array!45776 array!45778 (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 (_ BitVec 32) Int) ListLongMap!8655)

(assert (=> b!822829 (= lt!370530 (getCurrentListMap!2507 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24723)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822829 (= lt!370531 (getCurrentListMap!2507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23800 () Bool)

(declare-fun mapRes!23800 () Bool)

(assert (=> mapIsEmpty!23800 mapRes!23800))

(declare-fun b!822830 () Bool)

(declare-fun res!561161 () Bool)

(assert (=> b!822830 (=> (not res!561161) (not e!457527))))

(assert (=> b!822830 (= res!561161 (and (= (size!22359 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22358 _keys!976) (size!22359 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822831 () Bool)

(declare-fun e!457530 () Bool)

(assert (=> b!822831 (= e!457529 (and e!457530 mapRes!23800))))

(declare-fun condMapEmpty!23800 () Bool)

(declare-fun mapDefault!23800 () ValueCell!6980)

