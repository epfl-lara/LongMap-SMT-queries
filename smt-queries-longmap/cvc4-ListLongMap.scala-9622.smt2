; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113856 () Bool)

(assert start!113856)

(declare-fun b!1350406 () Bool)

(declare-fun res!895866 () Bool)

(declare-fun e!768214 () Bool)

(assert (=> b!1350406 (=> (not res!895866) (not e!768214))))

(declare-datatypes ((array!92053 0))(
  ( (array!92054 (arr!44476 (Array (_ BitVec 32) (_ BitVec 64))) (size!45026 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92053)

(assert (=> b!1350406 (= res!895866 (bvsle #b00000000000000000000000000000000 (size!45026 a!3742)))))

(declare-fun b!1350407 () Bool)

(declare-fun res!895870 () Bool)

(assert (=> b!1350407 (=> (not res!895870) (not e!768214))))

(declare-datatypes ((List!31517 0))(
  ( (Nil!31514) (Cons!31513 (h!32722 (_ BitVec 64)) (t!46175 List!31517)) )
))
(declare-fun acc!759 () List!31517)

(declare-fun contains!9226 (List!31517 (_ BitVec 64)) Bool)

(assert (=> b!1350407 (= res!895870 (not (contains!9226 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350408 () Bool)

(declare-fun e!768213 () Bool)

(assert (=> b!1350408 (= e!768214 e!768213)))

(declare-fun res!895865 () Bool)

(assert (=> b!1350408 (=> res!895865 e!768213)))

(assert (=> b!1350408 (= res!895865 (contains!9226 Nil!31514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!895867 () Bool)

(assert (=> start!113856 (=> (not res!895867) (not e!768214))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113856 (= res!895867 (and (bvslt (size!45026 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45026 a!3742))))))

(assert (=> start!113856 e!768214))

(declare-fun array_inv!33504 (array!92053) Bool)

(assert (=> start!113856 (array_inv!33504 a!3742)))

(assert (=> start!113856 true))

(declare-fun b!1350409 () Bool)

(declare-fun res!895869 () Bool)

(assert (=> b!1350409 (=> (not res!895869) (not e!768214))))

(declare-fun noDuplicate!2083 (List!31517) Bool)

(assert (=> b!1350409 (= res!895869 (noDuplicate!2083 acc!759))))

(declare-fun b!1350410 () Bool)

(declare-fun res!895868 () Bool)

(assert (=> b!1350410 (=> (not res!895868) (not e!768214))))

(assert (=> b!1350410 (= res!895868 (not (contains!9226 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350411 () Bool)

(declare-fun res!895864 () Bool)

(assert (=> b!1350411 (=> (not res!895864) (not e!768214))))

(assert (=> b!1350411 (= res!895864 (noDuplicate!2083 Nil!31514))))

(declare-fun b!1350412 () Bool)

(assert (=> b!1350412 (= e!768213 (contains!9226 Nil!31514 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113856 res!895867) b!1350409))

(assert (= (and b!1350409 res!895869) b!1350407))

(assert (= (and b!1350407 res!895870) b!1350410))

(assert (= (and b!1350410 res!895868) b!1350406))

(assert (= (and b!1350406 res!895866) b!1350411))

(assert (= (and b!1350411 res!895864) b!1350408))

(assert (= (and b!1350408 (not res!895865)) b!1350412))

(declare-fun m!1237619 () Bool)

(assert (=> b!1350412 m!1237619))

(declare-fun m!1237621 () Bool)

(assert (=> b!1350408 m!1237621))

(declare-fun m!1237623 () Bool)

(assert (=> b!1350410 m!1237623))

(declare-fun m!1237625 () Bool)

(assert (=> b!1350411 m!1237625))

(declare-fun m!1237627 () Bool)

(assert (=> b!1350409 m!1237627))

(declare-fun m!1237629 () Bool)

(assert (=> b!1350407 m!1237629))

(declare-fun m!1237631 () Bool)

(assert (=> start!113856 m!1237631))

(push 1)

(assert (not b!1350410))

(assert (not b!1350412))

(assert (not b!1350407))

(assert (not start!113856))

(assert (not b!1350408))

(assert (not b!1350409))

(assert (not b!1350411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144923 () Bool)

(declare-fun lt!596972 () Bool)

(declare-fun content!672 (List!31517) (Set (_ BitVec 64)))

(assert (=> d!144923 (= lt!596972 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!672 Nil!31514)))))

(declare-fun e!768232 () Bool)

(assert (=> d!144923 (= lt!596972 e!768232)))

(declare-fun res!895887 () Bool)

(assert (=> d!144923 (=> (not res!895887) (not e!768232))))

(assert (=> d!144923 (= res!895887 (is-Cons!31513 Nil!31514))))

(assert (=> d!144923 (= (contains!9226 Nil!31514 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596972)))

(declare-fun b!1350429 () Bool)

(declare-fun e!768231 () Bool)

(assert (=> b!1350429 (= e!768232 e!768231)))

(declare-fun res!895888 () Bool)

(assert (=> b!1350429 (=> res!895888 e!768231)))

(assert (=> b!1350429 (= res!895888 (= (h!32722 Nil!31514) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350430 () Bool)

(assert (=> b!1350430 (= e!768231 (contains!9226 (t!46175 Nil!31514) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144923 res!895887) b!1350429))

(assert (= (and b!1350429 (not res!895888)) b!1350430))

(declare-fun m!1237643 () Bool)

(assert (=> d!144923 m!1237643))

(declare-fun m!1237645 () Bool)

(assert (=> d!144923 m!1237645))

(declare-fun m!1237647 () Bool)

(assert (=> b!1350430 m!1237647))

(assert (=> b!1350408 d!144923))

(declare-fun d!144931 () Bool)

(declare-fun lt!596973 () Bool)

(assert (=> d!144931 (= lt!596973 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!672 acc!759)))))

(declare-fun e!768236 () Bool)

(assert (=> d!144931 (= lt!596973 e!768236)))

(declare-fun res!895891 () Bool)

(assert (=> d!144931 (=> (not res!895891) (not e!768236))))

(assert (=> d!144931 (= res!895891 (is-Cons!31513 acc!759))))

(assert (=> d!144931 (= (contains!9226 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596973)))

(declare-fun b!1350433 () Bool)

(declare-fun e!768235 () Bool)

(assert (=> b!1350433 (= e!768236 e!768235)))

(declare-fun res!895892 () Bool)

(assert (=> b!1350433 (=> res!895892 e!768235)))

(assert (=> b!1350433 (= res!895892 (= (h!32722 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350434 () Bool)

(assert (=> b!1350434 (= e!768235 (contains!9226 (t!46175 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144931 res!895891) b!1350433))

(assert (= (and b!1350433 (not res!895892)) b!1350434))

(declare-fun m!1237653 () Bool)

(assert (=> d!144931 m!1237653))

(declare-fun m!1237655 () Bool)

(assert (=> d!144931 m!1237655))

(declare-fun m!1237659 () Bool)

(assert (=> b!1350434 m!1237659))

(assert (=> b!1350407 d!144931))

(declare-fun d!144935 () Bool)

(declare-fun lt!596975 () Bool)

(assert (=> d!144935 (= lt!596975 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!672 Nil!31514)))))

(declare-fun e!768240 () Bool)

(assert (=> d!144935 (= lt!596975 e!768240)))

(declare-fun res!895895 () Bool)

(assert (=> d!144935 (=> (not res!895895) (not e!768240))))

(assert (=> d!144935 (= res!895895 (is-Cons!31513 Nil!31514))))

(assert (=> d!144935 (= (contains!9226 Nil!31514 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596975)))

(declare-fun b!1350437 () Bool)

(declare-fun e!768239 () Bool)

(assert (=> b!1350437 (= e!768240 e!768239)))

(declare-fun res!895896 () Bool)

(assert (=> b!1350437 (=> res!895896 e!768239)))

(assert (=> b!1350437 (= res!895896 (= (h!32722 Nil!31514) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350438 () Bool)

(assert (=> b!1350438 (= e!768239 (contains!9226 (t!46175 Nil!31514) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144935 res!895895) b!1350437))

(assert (= (and b!1350437 (not res!895896)) b!1350438))

(assert (=> d!144935 m!1237643))

(declare-fun m!1237665 () Bool)

(assert (=> d!144935 m!1237665))

(declare-fun m!1237667 () Bool)

(assert (=> b!1350438 m!1237667))

(assert (=> b!1350412 d!144935))

(declare-fun d!144939 () Bool)

(declare-fun res!895913 () Bool)

(declare-fun e!768257 () Bool)

(assert (=> d!144939 (=> res!895913 e!768257)))

(assert (=> d!144939 (= res!895913 (is-Nil!31514 Nil!31514))))

(assert (=> d!144939 (= (noDuplicate!2083 Nil!31514) e!768257)))

(declare-fun b!1350455 () Bool)

(declare-fun e!768258 () Bool)

(assert (=> b!1350455 (= e!768257 e!768258)))

(declare-fun res!895914 () Bool)

(assert (=> b!1350455 (=> (not res!895914) (not e!768258))))

(assert (=> b!1350455 (= res!895914 (not (contains!9226 (t!46175 Nil!31514) (h!32722 Nil!31514))))))

(declare-fun b!1350456 () Bool)

(assert (=> b!1350456 (= e!768258 (noDuplicate!2083 (t!46175 Nil!31514)))))

(assert (= (and d!144939 (not res!895913)) b!1350455))

(assert (= (and b!1350455 res!895914) b!1350456))

(declare-fun m!1237687 () Bool)

(assert (=> b!1350455 m!1237687))

