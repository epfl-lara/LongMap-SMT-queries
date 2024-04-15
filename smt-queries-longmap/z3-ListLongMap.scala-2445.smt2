; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38474 () Bool)

(assert start!38474)

(declare-fun b!397141 () Bool)

(declare-fun res!228058 () Bool)

(declare-fun e!240171 () Bool)

(assert (=> b!397141 (=> (not res!228058) (not e!240171))))

(declare-datatypes ((array!23709 0))(
  ( (array!23710 (arr!11304 (Array (_ BitVec 32) (_ BitVec 64))) (size!11657 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23709)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397141 (= res!228058 (or (= (select (arr!11304 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11304 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397142 () Bool)

(declare-fun e!240169 () Bool)

(assert (=> b!397142 (= e!240169 false)))

(declare-fun lt!187067 () Bool)

(declare-fun lt!187066 () array!23709)

(declare-datatypes ((List!6509 0))(
  ( (Nil!6506) (Cons!6505 (h!7361 (_ BitVec 64)) (t!11674 List!6509)) )
))
(declare-fun arrayNoDuplicates!0 (array!23709 (_ BitVec 32) List!6509) Bool)

(assert (=> b!397142 (= lt!187067 (arrayNoDuplicates!0 lt!187066 #b00000000000000000000000000000000 Nil!6506))))

(declare-fun b!397143 () Bool)

(declare-fun e!240173 () Bool)

(declare-fun e!240174 () Bool)

(declare-fun mapRes!16482 () Bool)

(assert (=> b!397143 (= e!240173 (and e!240174 mapRes!16482))))

(declare-fun condMapEmpty!16482 () Bool)

(declare-datatypes ((V!14315 0))(
  ( (V!14316 (val!4998 Int)) )
))
(declare-datatypes ((ValueCell!4610 0))(
  ( (ValueCellFull!4610 (v!7239 V!14315)) (EmptyCell!4610) )
))
(declare-datatypes ((array!23711 0))(
  ( (array!23712 (arr!11305 (Array (_ BitVec 32) ValueCell!4610)) (size!11658 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23711)

(declare-fun mapDefault!16482 () ValueCell!4610)

(assert (=> b!397143 (= condMapEmpty!16482 (= (arr!11305 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4610)) mapDefault!16482)))))

(declare-fun b!397144 () Bool)

(declare-fun res!228052 () Bool)

(assert (=> b!397144 (=> (not res!228052) (not e!240171))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23709 (_ BitVec 32)) Bool)

(assert (=> b!397144 (= res!228052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397145 () Bool)

(declare-fun res!228055 () Bool)

(assert (=> b!397145 (=> (not res!228055) (not e!240171))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397145 (= res!228055 (and (= (size!11658 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11657 _keys!709) (size!11658 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397146 () Bool)

(assert (=> b!397146 (= e!240171 e!240169)))

(declare-fun res!228051 () Bool)

(assert (=> b!397146 (=> (not res!228051) (not e!240169))))

(assert (=> b!397146 (= res!228051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187066 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!397146 (= lt!187066 (array!23710 (store (arr!11304 _keys!709) i!563 k0!794) (size!11657 _keys!709)))))

(declare-fun b!397147 () Bool)

(declare-fun res!228056 () Bool)

(assert (=> b!397147 (=> (not res!228056) (not e!240171))))

(assert (=> b!397147 (= res!228056 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11657 _keys!709))))))

(declare-fun b!397148 () Bool)

(declare-fun res!228053 () Bool)

(assert (=> b!397148 (=> (not res!228053) (not e!240171))))

(declare-fun arrayContainsKey!0 (array!23709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397148 (= res!228053 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397149 () Bool)

(declare-fun tp_is_empty!9907 () Bool)

(assert (=> b!397149 (= e!240174 tp_is_empty!9907)))

(declare-fun mapNonEmpty!16482 () Bool)

(declare-fun tp!32277 () Bool)

(declare-fun e!240172 () Bool)

(assert (=> mapNonEmpty!16482 (= mapRes!16482 (and tp!32277 e!240172))))

(declare-fun mapValue!16482 () ValueCell!4610)

(declare-fun mapKey!16482 () (_ BitVec 32))

(declare-fun mapRest!16482 () (Array (_ BitVec 32) ValueCell!4610))

(assert (=> mapNonEmpty!16482 (= (arr!11305 _values!549) (store mapRest!16482 mapKey!16482 mapValue!16482))))

(declare-fun res!228060 () Bool)

(assert (=> start!38474 (=> (not res!228060) (not e!240171))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38474 (= res!228060 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11657 _keys!709))))))

(assert (=> start!38474 e!240171))

(assert (=> start!38474 true))

(declare-fun array_inv!8300 (array!23711) Bool)

(assert (=> start!38474 (and (array_inv!8300 _values!549) e!240173)))

(declare-fun array_inv!8301 (array!23709) Bool)

(assert (=> start!38474 (array_inv!8301 _keys!709)))

(declare-fun b!397150 () Bool)

(declare-fun res!228057 () Bool)

(assert (=> b!397150 (=> (not res!228057) (not e!240171))))

(assert (=> b!397150 (= res!228057 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6506))))

(declare-fun b!397151 () Bool)

(declare-fun res!228059 () Bool)

(assert (=> b!397151 (=> (not res!228059) (not e!240171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397151 (= res!228059 (validMask!0 mask!1025))))

(declare-fun b!397152 () Bool)

(assert (=> b!397152 (= e!240172 tp_is_empty!9907)))

(declare-fun mapIsEmpty!16482 () Bool)

(assert (=> mapIsEmpty!16482 mapRes!16482))

(declare-fun b!397153 () Bool)

(declare-fun res!228054 () Bool)

(assert (=> b!397153 (=> (not res!228054) (not e!240171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397153 (= res!228054 (validKeyInArray!0 k0!794))))

(assert (= (and start!38474 res!228060) b!397151))

(assert (= (and b!397151 res!228059) b!397145))

(assert (= (and b!397145 res!228055) b!397144))

(assert (= (and b!397144 res!228052) b!397150))

(assert (= (and b!397150 res!228057) b!397147))

(assert (= (and b!397147 res!228056) b!397153))

(assert (= (and b!397153 res!228054) b!397141))

(assert (= (and b!397141 res!228058) b!397148))

(assert (= (and b!397148 res!228053) b!397146))

(assert (= (and b!397146 res!228051) b!397142))

(assert (= (and b!397143 condMapEmpty!16482) mapIsEmpty!16482))

(assert (= (and b!397143 (not condMapEmpty!16482)) mapNonEmpty!16482))

(get-info :version)

(assert (= (and mapNonEmpty!16482 ((_ is ValueCellFull!4610) mapValue!16482)) b!397152))

(assert (= (and b!397143 ((_ is ValueCellFull!4610) mapDefault!16482)) b!397149))

(assert (= start!38474 b!397143))

(declare-fun m!391947 () Bool)

(assert (=> start!38474 m!391947))

(declare-fun m!391949 () Bool)

(assert (=> start!38474 m!391949))

(declare-fun m!391951 () Bool)

(assert (=> b!397142 m!391951))

(declare-fun m!391953 () Bool)

(assert (=> b!397151 m!391953))

(declare-fun m!391955 () Bool)

(assert (=> b!397146 m!391955))

(declare-fun m!391957 () Bool)

(assert (=> b!397146 m!391957))

(declare-fun m!391959 () Bool)

(assert (=> b!397144 m!391959))

(declare-fun m!391961 () Bool)

(assert (=> b!397148 m!391961))

(declare-fun m!391963 () Bool)

(assert (=> mapNonEmpty!16482 m!391963))

(declare-fun m!391965 () Bool)

(assert (=> b!397153 m!391965))

(declare-fun m!391967 () Bool)

(assert (=> b!397141 m!391967))

(declare-fun m!391969 () Bool)

(assert (=> b!397150 m!391969))

(check-sat (not b!397144) (not b!397146) (not b!397150) tp_is_empty!9907 (not b!397142) (not mapNonEmpty!16482) (not b!397148) (not b!397151) (not b!397153) (not start!38474))
(check-sat)
