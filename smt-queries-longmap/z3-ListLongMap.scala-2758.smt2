; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40386 () Bool)

(assert start!40386)

(declare-fun mapNonEmpty!19305 () Bool)

(declare-fun mapRes!19305 () Bool)

(declare-fun tp!37287 () Bool)

(declare-fun e!261064 () Bool)

(assert (=> mapNonEmpty!19305 (= mapRes!19305 (and tp!37287 e!261064))))

(declare-fun mapKey!19305 () (_ BitVec 32))

(declare-datatypes ((V!16819 0))(
  ( (V!16820 (val!5937 Int)) )
))
(declare-datatypes ((ValueCell!5549 0))(
  ( (ValueCellFull!5549 (v!8182 V!16819)) (EmptyCell!5549) )
))
(declare-fun mapValue!19305 () ValueCell!5549)

(declare-datatypes ((array!27383 0))(
  ( (array!27384 (arr!13139 (Array (_ BitVec 32) ValueCell!5549)) (size!13492 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27383)

(declare-fun mapRest!19305 () (Array (_ BitVec 32) ValueCell!5549))

(assert (=> mapNonEmpty!19305 (= (arr!13139 _values!549) (store mapRest!19305 mapKey!19305 mapValue!19305))))

(declare-fun b!443875 () Bool)

(declare-fun res!263182 () Bool)

(declare-fun e!261063 () Bool)

(assert (=> b!443875 (=> (not res!263182) (not e!261063))))

(declare-datatypes ((array!27385 0))(
  ( (array!27386 (arr!13140 (Array (_ BitVec 32) (_ BitVec 64))) (size!13493 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27385)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443875 (= res!263182 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!263190 () Bool)

(assert (=> start!40386 (=> (not res!263190) (not e!261063))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40386 (= res!263190 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13493 _keys!709))))))

(assert (=> start!40386 e!261063))

(assert (=> start!40386 true))

(declare-fun e!261065 () Bool)

(declare-fun array_inv!9578 (array!27383) Bool)

(assert (=> start!40386 (and (array_inv!9578 _values!549) e!261065)))

(declare-fun array_inv!9579 (array!27385) Bool)

(assert (=> start!40386 (array_inv!9579 _keys!709)))

(declare-fun b!443876 () Bool)

(declare-fun e!261067 () Bool)

(declare-fun tp_is_empty!11785 () Bool)

(assert (=> b!443876 (= e!261067 tp_is_empty!11785)))

(declare-fun mapIsEmpty!19305 () Bool)

(assert (=> mapIsEmpty!19305 mapRes!19305))

(declare-fun b!443877 () Bool)

(declare-fun res!263191 () Bool)

(assert (=> b!443877 (=> (not res!263191) (not e!261063))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443877 (= res!263191 (and (= (size!13492 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13493 _keys!709) (size!13492 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443878 () Bool)

(declare-fun res!263184 () Bool)

(assert (=> b!443878 (=> (not res!263184) (not e!261063))))

(declare-datatypes ((List!7869 0))(
  ( (Nil!7866) (Cons!7865 (h!8721 (_ BitVec 64)) (t!13618 List!7869)) )
))
(declare-fun arrayNoDuplicates!0 (array!27385 (_ BitVec 32) List!7869) Bool)

(assert (=> b!443878 (= res!263184 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7866))))

(declare-fun b!443879 () Bool)

(declare-fun res!263188 () Bool)

(assert (=> b!443879 (=> (not res!263188) (not e!261063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443879 (= res!263188 (validMask!0 mask!1025))))

(declare-fun b!443880 () Bool)

(assert (=> b!443880 (= e!261064 tp_is_empty!11785)))

(declare-fun b!443881 () Bool)

(declare-fun res!263183 () Bool)

(assert (=> b!443881 (=> (not res!263183) (not e!261063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443881 (= res!263183 (validKeyInArray!0 k0!794))))

(declare-fun b!443882 () Bool)

(declare-fun e!261066 () Bool)

(assert (=> b!443882 (= e!261063 e!261066)))

(declare-fun res!263186 () Bool)

(assert (=> b!443882 (=> (not res!263186) (not e!261066))))

(declare-fun lt!203212 () array!27385)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27385 (_ BitVec 32)) Bool)

(assert (=> b!443882 (= res!263186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203212 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443882 (= lt!203212 (array!27386 (store (arr!13140 _keys!709) i!563 k0!794) (size!13493 _keys!709)))))

(declare-fun b!443883 () Bool)

(assert (=> b!443883 (= e!261065 (and e!261067 mapRes!19305))))

(declare-fun condMapEmpty!19305 () Bool)

(declare-fun mapDefault!19305 () ValueCell!5549)

(assert (=> b!443883 (= condMapEmpty!19305 (= (arr!13139 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5549)) mapDefault!19305)))))

(declare-fun b!443884 () Bool)

(declare-fun res!263185 () Bool)

(assert (=> b!443884 (=> (not res!263185) (not e!261063))))

(assert (=> b!443884 (= res!263185 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13493 _keys!709))))))

(declare-fun b!443885 () Bool)

(declare-fun res!263187 () Bool)

(assert (=> b!443885 (=> (not res!263187) (not e!261063))))

(assert (=> b!443885 (= res!263187 (or (= (select (arr!13140 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13140 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443886 () Bool)

(assert (=> b!443886 (= e!261066 false)))

(declare-fun lt!203213 () Bool)

(assert (=> b!443886 (= lt!203213 (arrayNoDuplicates!0 lt!203212 #b00000000000000000000000000000000 Nil!7866))))

(declare-fun b!443887 () Bool)

(declare-fun res!263189 () Bool)

(assert (=> b!443887 (=> (not res!263189) (not e!261063))))

(assert (=> b!443887 (= res!263189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40386 res!263190) b!443879))

(assert (= (and b!443879 res!263188) b!443877))

(assert (= (and b!443877 res!263191) b!443887))

(assert (= (and b!443887 res!263189) b!443878))

(assert (= (and b!443878 res!263184) b!443884))

(assert (= (and b!443884 res!263185) b!443881))

(assert (= (and b!443881 res!263183) b!443885))

(assert (= (and b!443885 res!263187) b!443875))

(assert (= (and b!443875 res!263182) b!443882))

(assert (= (and b!443882 res!263186) b!443886))

(assert (= (and b!443883 condMapEmpty!19305) mapIsEmpty!19305))

(assert (= (and b!443883 (not condMapEmpty!19305)) mapNonEmpty!19305))

(get-info :version)

(assert (= (and mapNonEmpty!19305 ((_ is ValueCellFull!5549) mapValue!19305)) b!443880))

(assert (= (and b!443883 ((_ is ValueCellFull!5549) mapDefault!19305)) b!443876))

(assert (= start!40386 b!443883))

(declare-fun m!429409 () Bool)

(assert (=> mapNonEmpty!19305 m!429409))

(declare-fun m!429411 () Bool)

(assert (=> b!443875 m!429411))

(declare-fun m!429413 () Bool)

(assert (=> b!443886 m!429413))

(declare-fun m!429415 () Bool)

(assert (=> b!443885 m!429415))

(declare-fun m!429417 () Bool)

(assert (=> b!443887 m!429417))

(declare-fun m!429419 () Bool)

(assert (=> b!443882 m!429419))

(declare-fun m!429421 () Bool)

(assert (=> b!443882 m!429421))

(declare-fun m!429423 () Bool)

(assert (=> b!443878 m!429423))

(declare-fun m!429425 () Bool)

(assert (=> b!443881 m!429425))

(declare-fun m!429427 () Bool)

(assert (=> start!40386 m!429427))

(declare-fun m!429429 () Bool)

(assert (=> start!40386 m!429429))

(declare-fun m!429431 () Bool)

(assert (=> b!443879 m!429431))

(check-sat (not b!443887) (not mapNonEmpty!19305) (not b!443879) (not b!443875) (not b!443882) (not b!443878) (not b!443881) (not b!443886) (not start!40386) tp_is_empty!11785)
(check-sat)
