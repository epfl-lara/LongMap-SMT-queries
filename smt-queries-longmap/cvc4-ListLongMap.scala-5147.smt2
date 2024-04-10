; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69820 () Bool)

(assert start!69820)

(declare-fun mapIsEmpty!22570 () Bool)

(declare-fun mapRes!22570 () Bool)

(assert (=> mapIsEmpty!22570 mapRes!22570))

(declare-fun b!812098 () Bool)

(declare-fun e!449733 () Bool)

(declare-datatypes ((array!44228 0))(
  ( (array!44229 (arr!21179 (Array (_ BitVec 32) (_ BitVec 64))) (size!21600 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44228)

(assert (=> b!812098 (= e!449733 (and (bvsle #b00000000000000000000000000000000 (size!21600 _keys!976)) (bvsge (size!21600 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!22570 () Bool)

(declare-fun tp!43678 () Bool)

(declare-fun e!449731 () Bool)

(assert (=> mapNonEmpty!22570 (= mapRes!22570 (and tp!43678 e!449731))))

(declare-datatypes ((V!23671 0))(
  ( (V!23672 (val!7049 Int)) )
))
(declare-datatypes ((ValueCell!6586 0))(
  ( (ValueCellFull!6586 (v!9475 V!23671)) (EmptyCell!6586) )
))
(declare-datatypes ((array!44230 0))(
  ( (array!44231 (arr!21180 (Array (_ BitVec 32) ValueCell!6586)) (size!21601 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44230)

(declare-fun mapRest!22570 () (Array (_ BitVec 32) ValueCell!6586))

(declare-fun mapValue!22570 () ValueCell!6586)

(declare-fun mapKey!22570 () (_ BitVec 32))

(assert (=> mapNonEmpty!22570 (= (arr!21180 _values!788) (store mapRest!22570 mapKey!22570 mapValue!22570))))

(declare-fun res!554990 () Bool)

(assert (=> start!69820 (=> (not res!554990) (not e!449733))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69820 (= res!554990 (validMask!0 mask!1312))))

(assert (=> start!69820 e!449733))

(declare-fun array_inv!16969 (array!44228) Bool)

(assert (=> start!69820 (array_inv!16969 _keys!976)))

(assert (=> start!69820 true))

(declare-fun e!449734 () Bool)

(declare-fun array_inv!16970 (array!44230) Bool)

(assert (=> start!69820 (and (array_inv!16970 _values!788) e!449734)))

(declare-fun b!812099 () Bool)

(declare-fun res!554991 () Bool)

(assert (=> b!812099 (=> (not res!554991) (not e!449733))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812099 (= res!554991 (and (= (size!21601 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21600 _keys!976) (size!21601 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812100 () Bool)

(declare-fun res!554992 () Bool)

(assert (=> b!812100 (=> (not res!554992) (not e!449733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44228 (_ BitVec 32)) Bool)

(assert (=> b!812100 (= res!554992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812101 () Bool)

(declare-fun e!449730 () Bool)

(assert (=> b!812101 (= e!449734 (and e!449730 mapRes!22570))))

(declare-fun condMapEmpty!22570 () Bool)

(declare-fun mapDefault!22570 () ValueCell!6586)

