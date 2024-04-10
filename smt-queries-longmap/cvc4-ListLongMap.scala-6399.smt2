; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82194 () Bool)

(assert start!82194)

(declare-fun b_free!18467 () Bool)

(declare-fun b_next!18467 () Bool)

(assert (=> start!82194 (= b_free!18467 (not b_next!18467))))

(declare-fun tp!64362 () Bool)

(declare-fun b_and!29955 () Bool)

(assert (=> start!82194 (= tp!64362 b_and!29955)))

(declare-fun b!957983 () Bool)

(declare-fun res!641242 () Bool)

(declare-fun e!540072 () Bool)

(assert (=> b!957983 (=> (not res!641242) (not e!540072))))

(declare-datatypes ((array!58449 0))(
  ( (array!58450 (arr!28098 (Array (_ BitVec 32) (_ BitVec 64))) (size!28577 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58449)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58449 (_ BitVec 32)) Bool)

(assert (=> b!957983 (= res!641242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641241 () Bool)

(assert (=> start!82194 (=> (not res!641241) (not e!540072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82194 (= res!641241 (validMask!0 mask!2088))))

(assert (=> start!82194 e!540072))

(assert (=> start!82194 true))

(declare-fun tp_is_empty!21173 () Bool)

(assert (=> start!82194 tp_is_empty!21173))

(declare-fun array_inv!21795 (array!58449) Bool)

(assert (=> start!82194 (array_inv!21795 _keys!1668)))

(declare-datatypes ((V!33213 0))(
  ( (V!33214 (val!10637 Int)) )
))
(declare-datatypes ((ValueCell!10105 0))(
  ( (ValueCellFull!10105 (v!13194 V!33213)) (EmptyCell!10105) )
))
(declare-datatypes ((array!58451 0))(
  ( (array!58452 (arr!28099 (Array (_ BitVec 32) ValueCell!10105)) (size!28578 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58451)

(declare-fun e!540075 () Bool)

(declare-fun array_inv!21796 (array!58451) Bool)

(assert (=> start!82194 (and (array_inv!21796 _values!1386) e!540075)))

(assert (=> start!82194 tp!64362))

(declare-fun b!957984 () Bool)

(declare-fun res!641244 () Bool)

(assert (=> b!957984 (=> (not res!641244) (not e!540072))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!957984 (= res!641244 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28577 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28577 _keys!1668))))))

(declare-fun mapIsEmpty!33739 () Bool)

(declare-fun mapRes!33739 () Bool)

(assert (=> mapIsEmpty!33739 mapRes!33739))

(declare-fun b!957985 () Bool)

(declare-fun res!641246 () Bool)

(assert (=> b!957985 (=> (not res!641246) (not e!540072))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957985 (= res!641246 (and (= (size!28578 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28577 _keys!1668) (size!28578 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33739 () Bool)

(declare-fun tp!64361 () Bool)

(declare-fun e!540073 () Bool)

(assert (=> mapNonEmpty!33739 (= mapRes!33739 (and tp!64361 e!540073))))

(declare-fun mapValue!33739 () ValueCell!10105)

(declare-fun mapRest!33739 () (Array (_ BitVec 32) ValueCell!10105))

(declare-fun mapKey!33739 () (_ BitVec 32))

(assert (=> mapNonEmpty!33739 (= (arr!28099 _values!1386) (store mapRest!33739 mapKey!33739 mapValue!33739))))

(declare-fun b!957986 () Bool)

(assert (=> b!957986 (= e!540073 tp_is_empty!21173)))

(declare-fun b!957987 () Bool)

(declare-fun e!540071 () Bool)

(assert (=> b!957987 (= e!540075 (and e!540071 mapRes!33739))))

(declare-fun condMapEmpty!33739 () Bool)

(declare-fun mapDefault!33739 () ValueCell!10105)

